import 'package:approyal/constants/routes.dart';
import 'package:approyal/services/services/auth/auth_service.dart';
import 'package:approyal/utilities/dialogs/logout_dialog.dart';
import 'package:approyal/views/Pago/forma_pago_view.dart';
import 'package:approyal/views/products/list_products.dart';
import 'package:approyal/views/products/create_update_product_view.dart';
import 'package:approyal/views/products/products_view.dart';
import 'package:flutter/material.dart';

class ProfileMenuView extends StatelessWidget {
  const ProfileMenuView({super.key});

  String get userEmail => AuthService.firebase().currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          color: Colors.white,
          child: ListView(
            padding: const EdgeInsets.only(top: 50.0),
            children: [
              const SizedBox(
                height: 75,
                width: 100,
                child: UserAccountsDrawerHeader(
                  accountName: Text(''),
                  accountEmail: Text(''),
                  //margin: EdgeInsets.symmetric({double vertical: 10.00 ,double horizontal: 10.00}),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/Logo.jpeg'),
                    ),
                  ),
                ),
              ),
              //new Divider(),
              ListTile(
                  title: const Text(
                    'Home',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: const Icon(
                    Icons.home,
                    size: 30.0,
                    color: Colors.black,
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => (const FormaPago())))),
              const Divider(),

              ListTile(
                  title: const Text(
                    'Historial de Ventas',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: const Icon(
                    Icons.shop,
                    size: 30.0,
                    color: Colors.black,
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => (const FormaPago())))),
              const Divider(),

              ListTile(
                  title: const Text(
                    'Productos',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: const Icon(
                    Icons.fastfood,
                    size: 30.0,
                    color: Colors.black,
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          (const ProductsView())))),

              const Divider(),
              ListTile(
                  title: const Text(
                    'Agregar Producto',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: const Icon(
                    Icons.production_quantity_limits_outlined,
                    size: 30.0,
                    color: Colors.black,
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          (const CreateUpdateNoteView())))),

              const Divider(),

              ListTile(
                  title: const Text(
                    'Listado Productos',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: const Icon(
                    Icons.fastfood,
                    size: 30.0,
                    color: Colors.black,
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          (const ListaProductos())))),

              const Divider(),
              ListTile(
                title: const Text(
                  'Log out',
                  style: TextStyle(color: Colors.black),
                ),
                trailing: const Icon(
                  Icons.logout,
                  size: 30.0,
                  color: Colors.black,
                ),
                onTap: () async {
                  final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout) {
                    await AuthService.firebase().logOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRoute,
                      (route) => false,
                    );
                  }
                },
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
