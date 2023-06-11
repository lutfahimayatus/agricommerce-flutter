import 'package:e_commerce_flutter/core/app_theme.dart';
import 'package:e_commerce_flutter/src/utils/secure_storage.dart';
import 'package:e_commerce_flutter/src/view/screen/home/home_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secureStorage = ref.watch(secureStorageProvider);
    final token = secureStorage.valueOrNull?['token'];
    Widget initialScreen = const LoginScreen();

    // ref.read(secureStorageProvider.notifier).remove('token');

    if (token != null && token.isNotEmpty) {
      initialScreen = const HomeScreen();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: initialScreen,
      theme: AppTheme.lightAppTheme,
    );
  }
}
