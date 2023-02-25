import 'package:approyal/constants/routes.dart';
import 'package:approyal/services/services/auth/auth_service.dart';
import 'package:approyal/views/login_view.dart';
import 'package:approyal/views/products_view.dart';
import 'package:approyal/views/register_view.dart';
import 'package:approyal/views/verify_email_view.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        // each route is defined as a constant in /constants/routes
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        productsRoute: (context) => const ProductsView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const ProductsView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
