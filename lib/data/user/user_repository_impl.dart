import 'package:firebase_auth/firebase_auth.dart';
import 'package:restorecommendapps/data/user/user_remote_datasource.dart';
import 'package:restorecommendapps/domain/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource remoteDatasource;
  UserRepositoryImpl(this.remoteDatasource);

  @override
  Future<void> saveUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    await remoteDatasource.saveUser(user);
  }

  @override
  Future<bool> validateUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return false;
    return remoteDatasource.isUserExists(user.uid);
  }

}