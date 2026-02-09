import 'package:flutter/material.dart';
import 'package:restorecommendapps/data/auth/auth_remote_datasource.dart';
import 'package:restorecommendapps/data/auth/auth_repository_impl.dart';
import 'package:restorecommendapps/data/user/user_remote_datasource.dart';
import 'package:restorecommendapps/data/user/user_repository_impl.dart';
import 'package:restorecommendapps/domain/auth/login_with_google_usecase.dart';
import 'package:restorecommendapps/domain/user/save_user_use_case.dart';
import 'package:restorecommendapps/domain/user/validate_user_use_case.dart';
import 'package:restorecommendapps/presentation/home/home_screen.dart';
import 'package:restorecommendapps/presentation/login/login_controller.dart';
import 'package:restorecommendapps/theme/app_colors.dart';
import 'package:restorecommendapps/core/dialogs/dialog_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginController controller;

  @override
  void initState() {
    super.initState();

    controller = LoginController(
      LoginWithGoogleUsecase(AuthRepositoryImpl(AuthRemoteDatasource())),
      ValidateUserUseCase(
        UserRepositoryImpl(
          UserRemoteDatasource()
        )
      ),
      SaveUserUseCase(
        UserRepositoryImpl(
          UserRemoteDatasource()
        )
      )
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
    _validateLoginStatus();
  });
  }

  Future<void> _validateLoginStatus() async {
    final result = await controller.isUserLoggedIn();
    DialogHelper.showLoading(context, message: 'Verifikasi Akun Kamu');
    await Future.delayed(const Duration(milliseconds: 600));

    DialogHelper.hide(context);

    if (result) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  Future<void> _login(BuildContext context) async {
    DialogHelper.showLoading(context);

    try {
      final result = await controller.login();
      DialogHelper.hide(context);

      if (result != null) {
        DialogHelper.showSuccess(
          context,
          message: 'Login Berhasil',
          onOk: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
          },
        );
      } else {
        DialogHelper.showError(context, message: 'Login Dibatalkan');
      }
    } catch (_) {
      DialogHelper.hide(context);
      DialogHelper.showError(context, message: 'Terjadi Kesalahan');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Makan Apa Kita Hari Ini?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              'Temukan Tempat Makan Paling Syahduuuu Disini!',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: AppColors.secondary,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
              ),
              icon: const Icon(Icons.login, color: AppColors.primary),
              label: const Text(
                'Login Dengan Google',
                style: TextStyle(color: AppColors.primary),
              ),
              onPressed: () => _login(context),
            ),
          ],
        ),
      ),
    );
  }
}
