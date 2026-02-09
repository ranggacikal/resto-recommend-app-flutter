import 'package:restorecommendapps/domain/user/user_repository.dart';

class ValidateUserUseCase {
  final UserRepository repository;
  ValidateUserUseCase(this.repository);

  Future<bool> execute() {
    return repository.validateUser();
  }
}