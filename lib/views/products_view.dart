import 'package:approyal/services/services/auth/auth_service.dart';
import 'package:approyal/services/services/sqlite/db_service.dart';
import 'package:flutter/material.dart';
import '../constants/routes.dart';
import '../enums/menu_action.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  late final ProductService _productService;
  String get userEmail => AuthService.firebase().currentUser!.email!;

  @override
  void initState() {
    _productService = ProductService();

    super.initState();
  }

  @override
  void dispose() {
    _productService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main UI'),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout) {
                    await AuthService.firebase().logOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRoute,
                      (route) => false,
                    );
                  }
                  break;
                default:
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text('logout'),
                ),
              ];
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: _productService.getOrCreateUser(email: userEmail),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return StreamBuilder(
                stream: _productService.allProducts,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Text('Waiting for all notes');
                    default:
                      return const CircularProgressIndicator();
                  }
                },
              );
            default:
              return const Text('Hello');
          }
        }),
      ),
    );
  }
}

// Show logout dialog confirmation and returns a boolean
Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Sign out'),
        content: const Text('Estas seguro de que quieres cerrar sesion?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancelar')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Log Out')),
        ],
      );
    },
  ).then((value) => value ?? false);
}
