import 'package:approyal/constants/routes.dart';
import 'package:approyal/services/services/auth/auth_service.dart';
import 'package:approyal/views/Navigation/profile_menu_view.dart';
import 'package:approyal/views/OrdersHist/historial_ordenes_view.dart';
import 'package:approyal/views/Pago/cheque_directo_view.dart';
import 'package:approyal/views/Pago/contrato_anual_view.dart';
import 'package:approyal/views/Pago/credito_directo_view.dart';
import 'package:approyal/views/Pago/detalle_tarjeta_view.dart';
import 'package:approyal/views/Pago/forma_pago_view.dart';
import 'package:approyal/views/Pago/tarjeta_credito_view.dart';
import 'package:approyal/views/basket/pedido_lista.dart';
import 'package:approyal/views/login_view.dart';
import 'package:approyal/views/products/create_update_product_view.dart';
import 'package:approyal/views/products/products_view.dart';
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
          profileMenuRoute: (context) => const ProfileMenuView(),
          createOrUpdateProductRoute: (context) => const CreateUpdateNoteView(),
          carritoRoute: (context) => const CartView(),
          resumenPagoRoute: (context) => const FormaPago(),
          chequeRoute: (context) => const ChequeDirecto(),
          creditoRoute: (context) => const CreditoDirecto(),
          tarjetaCreditoRoute: (constext) => const TarjetaCredito(),
          contratoCreditoRoute: (context) => const TasaAnual(),
          detalleTcRoute: (context) => const detalle_tc(),
          historialOrdenesRoute: (context) => const ContVentas()
        }),
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
