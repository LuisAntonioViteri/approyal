import 'package:approyal/constants/routes.dart';
import 'package:approyal/services/cloud/cloud_detail.dart';
import 'package:approyal/utilities/generics/get_arguments.dart';
import 'package:flutter/material.dart';

class CreditoDirecto extends StatefulWidget {
  const CreditoDirecto({super.key});

  @override
  State<CreditoDirecto> createState() => _CreditoDirecto();
}

class _CreditoDirecto extends State<CreditoDirecto> {
  bool? _agree = false;
  List<CloudDetail> carrito = [];
  List<CloudDetail>? cart = [];
  double precio = 0;
  double _total = 0;
  double agregado = 0;
  double entrada = 0;
  int ninversiones = 1;
  List<int> numinversiones = [1, 2, 3, 4, 5];
  late final TextEditingController _textController;
  late final TextEditingController _textControllerEntrada;
  bool? _textvalid = true;

  @override
  void initState() {
    _textController = TextEditingController();
    _textControllerEntrada = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void valorTotal(Iterable<CloudDetail> listaProductos) {
    if (listaProductos.isEmpty) {
      setState(() {
        precio = 0;
      });
    }
    double total = listaProductos
        .map((element) => element.totalproducto)
        .reduce((value, element) => value + element);

    setState(() {
      precio = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    cart = context.getArgument<List<CloudDetail>>();
    carrito = cart!;
    if (precio == 0) {
      final double total = carrito
          .map((element) => element.totalproducto)
          .reduce((value, element) => value + element);
      setState(() {
        precio = total;

        _total = total;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crédito Directo'),
        backgroundColor: const Color.fromARGB(255, 7, 77, 228),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(left: 120),
                    height: 70,
                    width: 400,
                    color: const Color.fromARGB(255, 177, 177, 177),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Total: \$${precio.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        //dding: EdgeInsets.only(left: 60),
                        height: 50,
                        width: 400,
                        color: const Color.fromARGB(255, 7, 77, 228),
                        child: const Center(
                          child: Text(
                            "Agregado",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        //padding: EdgeInsets.only(left: 0),
                        height: 50,
                        width: 30.0,
                        color: const Color.fromARGB(255, 168, 168, 168),
                        child: Checkbox(
                          value: _agree,
                          onChanged: (value) {
                            setState(() {
                              _agree = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            _agree == false
                ? Container()
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          //borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.only(left: 60),
                            height: 30,
                            width: 400,
                            color: const Color.fromARGB(0, 7, 77, 228),
                            child: const Text(
                              "Cantidad:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              //padding: EdgeInsets.only(left: 60),
                              height: 50,
                              width: 30.0,
                              color: const Color.fromARGB(255, 168, 168, 168),
                              child: Center(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      hintText: 'Valor agregado'),
                                  controller: _textController,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  onChanged: (value) {
                                    setState(() {
                                      if (double.tryParse(value) != null) {
                                        agregado = double.parse(value);
                                      } else if (value.isEmpty) {
                                        agregado = 0;
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        //dding: EdgeInsets.only(left: 60),
                        height: 50,
                        width: 400,
                        color: const Color.fromARGB(255, 7, 77, 228),
                        child: const Center(
                          child: Text(
                            "Entrada",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        //padding: EdgeInsets.only(left: 60),
                        height: 50,
                        width: 30.0,
                        color: const Color.fromARGB(255, 168, 168, 168),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                                hintText: 'Valor de entrada'),
                            controller: _textControllerEntrada,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            onChanged: (value) {
                              setState(() {
                                if (double.tryParse(value) != null) {
                                  entrada = double.parse(value);
                                } else if (value.isEmpty) {
                                  entrada = 0;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 20),
                    height: 70,
                    width: 400,
                    color: const Color.fromARGB(255, 177, 177, 177),
                    child: Row(
                      children: [
                        Text(
                          'Saldo a financiar: \$${(_total - entrada + agregado).toStringAsFixed(2)} ',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        //dding: EdgeInsets.only(left: 60),
                        height: 50,
                        width: 400,
                        color: const Color.fromARGB(255, 7, 77, 228),
                        child: const Center(
                          child: Text(
                            "N° de Inversiones: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.only(left: 60),
                        height: 50,
                        width: 30.0,
                        color: const Color.fromARGB(255, 168, 168, 168),
                        child: DropdownButton<int>(
                          value: ninversiones,
                          onChanged: (newValue) {
                            setState(() {
                              if (newValue != null) {
                                ninversiones = newValue;
                              }
                            });
                          },
                          items: numinversiones
                              .map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(
                                value.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    //dding: EdgeInsets.only(left: 60),
                    height: 50,
                    width: 900,
                    color: const Color.fromARGB(255, 7, 77, 228),
                    child: Center(
                      child: Text(
                        "Total: \$${_total.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 7, 77, 228),
                  minimumSize: const Size(150, 50),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, contratoCreditoRoute);
                },
                child: const Text(
                  "Proceder al Pago",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
