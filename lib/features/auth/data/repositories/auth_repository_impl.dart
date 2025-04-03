import 'package:flutter_application_1/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<String?> login(String email, String password) async {
    return await remoteDataSource.login(email, password);
  }
}
