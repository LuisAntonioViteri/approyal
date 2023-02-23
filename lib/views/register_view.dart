import 'package:approyal/constants/routes.dart';
import 'package:approyal/services/auth/auth_exceptions.dart';
import 'package:approyal/services/auth/auth_service.dart';
import 'package:approyal/utilities/show_error_dialog.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
      appBar: AppBar(title: const Text('Register')),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Correo electronico"),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(hintText: "Contraseña"),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                await AuthService.firebase().registerUser(
                  email: email,
                  password: password,
                );
                final user = AuthService.firebase().currentUser;
                await AuthService.firebase().sendEmailVerification();
                Navigator.of(context).pushNamed(verifyEmailRoute);
              } on WeakPasswordAuthException {
                showErrorDialog(
                  context,
                  'Contrasena debil',
                );
              } on EmailAlreadyInUseAuthException {
                showErrorDialog(
                  context,
                  'Email ya registrado',
                );
              } on InvalidEmailAuthException {
                showErrorDialog(
                  context,
                  'Email invalido',
                );
              } on GenericAuthException {
                showErrorDialog(
                  context,
                  'Fallo al registrar',
                );
              }
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
