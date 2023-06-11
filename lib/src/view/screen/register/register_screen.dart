import 'package:e_commerce_flutter/src/utils/async_ui.dart';
import 'package:e_commerce_flutter/src/view/screen/home/home_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/register/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app_properties.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cmfPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(registerControllerProvider, (_, state) {
      state.showSnackbarOnError(context);

      if (!state.isLoading && !state.hasError) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          ),
          (route) => false,
        );
      }
    });

    final controller = ref.watch(registerControllerProvider);

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Spacer(flex: 3),
                title(),
                const Spacer(),
                subTitle(),
                const Spacer(flex: 2),
                registerForm(controller),
                const Spacer(flex: 2),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: socialRegister(),
                )
              ],
            ),
          ),
          Positioned(
            top: 35,
            left: 5,
            child: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget title() => const Text(
        'Register',
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
        'Daftar sekarang juga',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ));

  Widget registerButton(AsyncValue<void> controller) => Positioned(
        left: MediaQuery.of(context).size.width / 4,
        bottom: 40,
        child: InkWell(
          onTap: () {
            ref.read(registerControllerProvider.notifier).submit(
                  name: _nameController.text,
                  email: _emailController.text,
                  password: _passwordController.text,
                  passwordConfirmation: _cmfPasswordController.text,
                );
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
                      "Register",
                      style: TextStyle(
                        color: Color(0xfffefefe),
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0,
                      ),
                    ),
            ),
          ),
        ),
      );

  Widget registerForm(AsyncValue<void> controller) => SizedBox(
        height: 380,
        child: Stack(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 32.0, right: 12.0),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      decoration: const InputDecoration(hintText: 'Nama'),
                      controller: _nameController,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      decoration: const InputDecoration(hintText: 'Email'),
                      controller: _emailController,
                      style: const TextStyle(fontSize: 16.0),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                          hintText: 'Konfirmasi Kata Sandi'),
                      controller: _cmfPasswordController,
                      style: const TextStyle(fontSize: 16.0),
                      obscureText: true,
                    ),
                  ),
                ],
              ),
            ),
            registerButton(controller),
          ],
        ),
      );

  Widget socialRegister() => Column(
        children: [
          const Text(
            'You can sign in with',
            style: TextStyle(
                fontSize: 12.0,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.find_replace),
                onPressed: () {},
                color: Colors.white,
              ),
              IconButton(
                  icon: const Icon(Icons.find_replace),
                  onPressed: () {},
                  color: Colors.white),
            ],
          )
        ],
      );
}
