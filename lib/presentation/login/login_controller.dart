import 'package:restorecommendapps/domain/auth/login_with_google_usecase.dart';
import 'package:restorecommendapps/domain/user/save_user_use_case.dart';
import 'package:restorecommendapps/domain/user/validate_user_use_case.dart';

class LoginController {
  final LoginWithGoogleUsecase loginWithGoogle;
  final ValidateUserUseCase validateUserLogin;
  final SaveUserUseCase saveUser;

  LoginController(
    this.loginWithGoogle,
    this.validateUserLogin,
    this.saveUser
    );

  Future login() async {
    final result = await loginWithGoogle.execute();
    if (result != null) {
      await saveUser.execute();
    }
    return result;
  }

  Future<bool> isUserLoggedIn() {
    return validateUserLogin.execute();
  }
}