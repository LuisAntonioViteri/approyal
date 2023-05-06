import 'package:approyal/constants/routes.dart';
import 'package:approyal/services/services/auth/auth_exceptions.dart';
import 'package:approyal/services/services/auth/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:approyal/utilities/dialogs/error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(56),
                child: Container(
                  height: 215,
                  width: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Logo.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(70),
                        ),
                        border: Border.all(
                          color: const Color.fromARGB(0, 33, 149, 243),
                        ),
                        color: const Color.fromARGB(255, 7, 77, 228),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              'Bienvenido/a',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              'Usuario:',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextField(
                              controller: _email,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Correo electrónico',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              'Contraseña:',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              controller: _password,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                hintText: 'Contraseña',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ElevatedButton(
                              onPressed: () async {
                                final email = _email.text;
                                final password = _password.text;
                                try {
                                  final userCredential =
                                      await AuthService.firebase().logIn(
                                    email: email,
                                    password: password,
                                  );
                                  final user =
                                      AuthService.firebase().currentUser;
                                  if (user?.isEmailVerified ?? false) {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            productsRoute, (route) => false);
                                  } else {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            verifyEmailRoute, (route) => false);
                                  }
                                } on UserNotFoundAuthException {
                                  await showErrorDialog(
                                    context,
                                    'User not found',
                                  );
                                } on WrongPasswordAuthException {
                                  await showErrorDialog(
                                    context,
                                    'Usuario o contrasena incorrecta',
                                  );
                                } on GenericAuthException {
                                  await showErrorDialog(
                                    context,
                                    'Authentication error',
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 26, 26, 26),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('Login'),
                            ),
                          ),
                          const SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Text.rich(
                              TextSpan(
                                text: '¿Aun no tienes una cuenta? ',
                                style: const TextStyle(color: Colors.white),
                                children: [
                                  TextSpan(
                                    text: 'Registrate aqui\n\n',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                          registerRoute,
                                          (route) => false,
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // TextButton(
              //   onPressed: () async {
              //     final email = _email.text;
              //     final password = _password.text;
              //     try {
              //       final userCredential = await AuthService.firebase().logIn(
              //         email: email,
              //         password: password,
              //       );
              //       final user = AuthService.firebase().currentUser;
              //       if (user?.isEmailVerified ?? false) {
              //         Navigator.of(context).pushNamedAndRemoveUntil(
              //             productsRoute, (route) => false);
              //       } else {
              //         Navigator.of(context).pushNamedAndRemoveUntil(
              //             verifyEmailRoute, (route) => false);
              //       }
              //     } on UserNotFoundAuthException {
              //       await showErrorDialog(
              //         context,
              //         'User not found',
              //       );
              //     } on WrongPasswordAuthException {
              //       await showErrorDialog(
              //         context,
              //         'Usuario o contrasena incorrecta',
              //       );
              //     } on GenericAuthException {
              //       await showErrorDialog(
              //         context,
              //         'Authentication error',
              //       );
              //     }
              //   },
              //   child: const Text('Login'),
              // ),
              // TextButton(
              //   onPressed: () {
              //     Navigator.of(context).pushNamedAndRemoveUntil(
              //       registerRoute,
              //       (route) => false,
              //     );
              //   },
              //   child: const Text('No estas registrado todavia? Hazlo aqui!'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
