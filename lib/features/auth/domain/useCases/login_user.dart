import 'package:flutter_application_1/features/auth/domain/repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<String?> call(String email, String password) async {
    return await repository.login(email, password);
  }
}
