import 'package:dio/dio.dart';
import 'package:e_commerce_flutter/src/domain/user/user.dart';
import 'package:e_commerce_flutter/src/network/client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this.client);

  Dio client;

  Future<User> login({
    required String email,
    required String password,
  }) async {
    final res = await client.post('/api/login', data: {
      'email': email,
      'password': password,
    });

    return User.fromJson(res.data['data']);
  }

  Future<User> register({
    required String email,
    required String name,
    required String password,
    required String passwordConfirmation,
  }) async {
    final res = await client.post('/api/register', data: {
      'email': email,
      'name': name,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });

    return User.fromJson(res.data['data']);
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final client = ref.watch(clientProvider);
  return AuthRepository(client);
}
