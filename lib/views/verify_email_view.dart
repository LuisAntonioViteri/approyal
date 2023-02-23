import 'package:approyal/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificar correo'),
      ),
      body: Column(
        children: [
          const Text(
              "Enviamos un correo de verificacion, abrelo para confirmar tu direccion de correo"),
          const Text('Si no lo haz recibido, haz click debajo'),
          TextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              await user?.sendEmailVerification();
            },
            child: const Text('Enviar email de verificacion'),
          ),
          TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              child: const Text('Volver a registro')),
        ],
      ),
    );
  }
}
