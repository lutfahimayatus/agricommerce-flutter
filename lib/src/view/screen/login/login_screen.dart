import 'package:e_commerce_flutter/src/utils/async_ui.dart';
import 'package:e_commerce_flutter/src/view/screen/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app_properties.dart';
import '../register/register_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(loginControllerProvider);
    ref.listen(loginControllerProvider, (_, state) {
      state.showSnackbarOnError(context);
    });

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: transparentGreen,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 3),
                  welcomeBack(),
                  const Spacer(),
                  subTitle(),
                  const Spacer(flex: 2),
                  loginForm(controller),
                  const Spacer(flex: 2),
                  forgotPassword()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget welcomeBack() => const Text(
        'Halo!',
        style: TextStyle(
            color: Colors.white,
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
            shadows: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ]),
      );

  Widget subTitle() => const Padding(
        padding: EdgeInsets.only(right: 56.0),
        child: Text(
          'Selamat Datang Kembali',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      );

  Widget loginButton(AsyncValue<void> controller) => Positioned(
        left: 81.5,
        right: 81.5,
        bottom: 18,
        child: InkWell(
          onTap: () async {
            ref
                .read(loginControllerProvider.notifier)
                .submit(_emailController.text, _passwordController.text);
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 80,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 18, 94, 32),
                      Color.fromARGB(255, 18, 94, 32),
                      Color.fromARGB(255, 18, 94, 32)
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    offset: Offset(0, 5),
                    blurRadius: 10.0,
                  )
                ],
                borderRadius: BorderRadius.circular(9.0)),
            child: Center(
              child: controller.isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
                      "Log In",
                      style: TextStyle(
                          color: Color(0xfffefefe),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0),
                    ),
            ),
          ),
        ),
      );

  Widget loginForm(AsyncValue<void> controller) => SizedBox(
        height: MediaQuery.of(context).size.height / 3.5,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 1.15,
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      decoration: const InputDecoration(hintText: 'Email'),
                      controller: _emailController,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      decoration: const InputDecoration(hintText: 'Kata Sandi'),
                      controller: _passwordController,
                      style: const TextStyle(fontSize: 16.0),
                      obscureText: true,
                    ),
                  ),
                ],
              ),
            ),
            loginButton(controller),
          ],
        ),
      );

  Widget forgotPassword() => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tidak punya akun? ',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Color.fromRGBO(255, 255, 255, 0.5),
                fontSize: 14.0,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const RegisterScreen(),
                  ),
                );
              },
              child: const Text(
                'Daftar sekarang',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      );
}
