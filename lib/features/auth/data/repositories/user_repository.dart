import 'package:flutter_application_1/features/user_management/data/datasourses/user_service.dart';

abstract class UserRepository {
  Future<bool> registerUser({
    required String email,
    required String password,
    required String name,
    required String lastName,
    required String phone,
  });
}

class UserRepositoryImpl implements UserRepository {
  final UserService remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<bool> registerUser({
    required String email,
    required String password,
    required String name,
    required String lastName,
    required String phone,
  }) async {
    return await remoteDataSource.registerUser(
      email: email,
      password: password,
      name: name,
      lastName: lastName,
      phone: phone,
    );
  }
}
