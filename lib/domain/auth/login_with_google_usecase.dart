import 'auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginWithGoogleUsecase {
  final AuthRepository repository;
  LoginWithGoogleUsecase(this.repository);
  Future<UserCredential?> execute() {
    return repository.loginWithGoogle();
  }
}