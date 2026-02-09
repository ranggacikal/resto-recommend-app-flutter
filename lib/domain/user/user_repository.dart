abstract class UserRepository {
  Future<void> saveUser();
  Future<bool> validateUser();
}