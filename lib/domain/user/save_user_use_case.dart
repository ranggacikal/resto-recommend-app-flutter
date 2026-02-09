import 'package:restorecommendapps/domain/user/user_repository.dart';

class SaveUserUseCase {
  final UserRepository repository;
  SaveUserUseCase(this.repository);

  Future<void> execute() {
    return repository.saveUser();
  }
}