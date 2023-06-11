import 'package:e_commerce_flutter/src/data/auth_repository.dart';
import 'package:e_commerce_flutter/src/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_controller.g.dart';

@riverpod
class RegisterController extends _$RegisterController {
  @override
  FutureOr<void> build() {}

  Future<void> submit({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    final authRepository = ref.watch(authRepositoryProvider);
    try {
      state = const AsyncLoading();
      final user = await authRepository.register(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      await ref.read(secureStorageProvider.notifier).write('token', user.token);
      state = const AsyncData(null);
    } catch (e) {
      debugPrint(e.toString());
      state = AsyncError(
          'Terjadi kesalahan saat mendaftarkan akun', StackTrace.current);
    }
  }
}
