import 'package:approyal/views/Navigation/profile_menu_view.dart';
import 'package:approyal/views/Pago/formas_pago_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants/routes.dart';
import '../../models/productos_model.dart';
import '../basket/pedido_lista.dart';

class ListaProductos extends StatelessWidget {
  const ListaProductos({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'App Productos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ProductosModel> _productosModel = [];
  final List<ProductosModel> _listaCarro = [];

  @override
  void initState() {
    super.initState();
    _productosDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  const Icon(
                    Icons.shopping_cart,
                    size: 38,
                    color: Colors.white,
                  ),
                  if (_listaCarro.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(_listaCarro.length.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.0)),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_listaCarro.isNotEmpty) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_listaCarro),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
      drawer: IconButton(
        icon: const Icon(Icons.person),
        onPressed: () {
          Navigator.pushNamed(context, profileMenuRoute);
        },
      ),
      body: _cuadroProductos(),
    );
  }

  GridView _cuadroProductos() {
    return GridView.builder(
      padding: const EdgeInsets.all(4.0),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: _productosModel.length,
      itemBuilder: (context, index) {
        final String image = _productosModel[index].image;
        var item = _productosModel[index];
        return Card(
          elevation: 4.0,
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Image.asset(
                    "assets/images/$image",
                    fit: BoxFit.contain,
                  )),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        item.price.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23.0,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 8.0,
                          bottom: 8.0,
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            child: (!_listaCarro.contains(item))
                                ? const Icon(
                                    Icons.shopping_cart,
                                    color: Colors.green,
                                    size: 38,
                                  )
                                : const Icon(
                                    Icons.shopping_cart,
                                    color: Colors.red,
                                    size: 38,
                                  ),
                            onTap: () {
                              setState(() {
                                if (!_listaCarro.contains(item)) {
                                  _listaCarro.add(item);
                                } else {
                                  _listaCarro.remove(item);
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void _productosDb() {
    var list = <ProductosModel>[
      ProductosModel(
          name: 'Olla de Presión 1', image: 'olla1.jpg', price: 110.6),
      ProductosModel(name: 'Olla Americana', image: 'olla2.jpg', price: 200.99),
      ProductosModel(
          name: 'Juego de Cuchillos', image: 'cuchillo1.jpg', price: 574.10),
      ProductosModel(
          name: 'Power Blender', image: 'powerbl.jpg', price: 200.22),
      ProductosModel(
        name: 'Parrilla de Acero',
        image: 'parrilla.jpg',
        price: 300.99,
      ),
    ];
    setState(() {
      _productosModel = list;
    });
  }
}
