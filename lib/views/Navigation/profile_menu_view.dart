import 'package:approyal/views/Pago/formas_pago_view.dart';
import 'package:approyal/views/products/list_products.dart';
import 'package:approyal/views/products/new_product_view.dart';
import 'package:approyal/views/products/products_view.dart';
import 'package:flutter/material.dart';

class ProfileMenuView extends StatelessWidget {
  const ProfileMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          color: Colors.white,
          child: ListView(
            padding: const EdgeInsets.only(top: 50.0),
            children: <Widget>[
              const SizedBox(
                height: 75,
                width: 100,
                child: UserAccountsDrawerHeader(
                  accountName: Text(''),
                  accountEmail: Text(''),
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
                          (const NewProductView())))),

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
            ],
          ),
        ),
      ),
    );
  }
}
