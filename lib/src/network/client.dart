import 'package:dio/dio.dart';
import 'package:e_commerce_flutter/src/utils/secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'client.g.dart';

@Riverpod(keepAlive: true)
Dio client(ClientRef ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  final token = secureStorage.valueOrNull?['token'];

  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:8000',
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (e, handler) {
        if (e.response?.statusCode == 401) {
          ref.read(secureStorageProvider.notifier).remove('token');
        } else {
          handler.next(e);
        }
      },
    ),
  );

  return dio;
}
