import 'package:e_commerce_flutter/src/data/auth_repository.dart';
import 'package:e_commerce_flutter/src/utils/secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() {}

  Future<void> submit(String email, String password) async {
    final authRepository = ref.watch(authRepositoryProvider);
    try {
      state = const AsyncLoading();
      final user = await authRepository.login(email: email, password: password);
      await ref.read(secureStorageProvider.notifier).write('token', user.token);
      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError('Terjadi kesalahan saat login', StackTrace.current);
    }
  }
}
