import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/auth/auth_repository.dart';
import 'auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl(this.remoteDatasource);
  
  @override
  Future<UserCredential?> loginWithGoogle() {
    return remoteDatasource.loginWithGoogle();
  }

}