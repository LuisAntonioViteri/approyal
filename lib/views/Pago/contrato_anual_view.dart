import 'package:flutter/material.dart';

class TasaAnual extends StatefulWidget {
  const TasaAnual({Key? key}) : super(key: key);

  @override
  _TasaAnualState createState() => _TasaAnualState();
}

class _TasaAnualState extends State<TasaAnual> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final EdgeInsets padding = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contrato Anual'),
        backgroundColor: const Color.fromARGB(255, 7, 77, 228),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(
            (screenSize.width * 0.05) - padding.left, // margen izquierdo
            (screenSize.height * 0.1) - padding.top, // margen superior
            (screenSize.width * 0.05) - padding.right, // margen derecho
            (screenSize.height * 0.14) - padding.bottom, // margen inferior
          ),
          decoration: BoxDecoration(
              border: Border.all(
                color:
                    const Color.fromARGB(255, 7, 77, 228), // color de la línea
                width: 2.0, // grosor de la línea
                style: BorderStyle.solid, // estilo de la línea
              ),
              borderRadius: BorderRadius.circular(10.0)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 100,
                      color: const Color.fromARGB(0, 158, 158, 158),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'CONTRATO',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 56, 56, 56),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Tasa anual del pagaré',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 56, 56, 56),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 160,
                      height: 75,
                      color: const Color.fromARGB(0, 255, 235, 59),
                      child: const Center(
                        child: Text(
                          'Precio de compra (s/iva)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 56, 56, 56),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 75,
                      color: const Color.fromARGB(0, 240, 15, 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Expanded(
                                child: const Text(
                                  '999.99',
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 56, 56, 56),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 160,
                      height: 75,
                      color: const Color.fromARGB(0, 255, 235, 59),
                      child: const Center(
                        child: Text(
                          'Costo despacho de manejo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 56, 56, 56),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 75,
                      color: const Color.fromARGB(0, 255, 11, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Expanded(
                                child: Text(
                                  '000.00',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 56, 56, 56),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 160,
                      height: 50,
                      color: const Color.fromARGB(0, 255, 235, 59),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'IVA de 12 ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 56, 56, 56),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 75,
                      color: const Color.fromARGB(0, 255, 11, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Expanded(
                                child: Text(
                                  '12%',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 56, 56, 56),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 160,
                      height: 50,
                      color: const Color.fromARGB(0, 255, 235, 59),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Precio Total',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 56, 56, 56),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 75,
                      color: const Color.fromARGB(0, 255, 11, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Expanded(
                                child: Text(
                                  '90.00',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 56, 56, 56),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 160,
                      height: 50,
                      color: const Color.fromARGB(0, 255, 235, 59),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Deposito pagado hoy',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 56, 56, 56),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 75,
                      color: const Color.fromARGB(0, 255, 11, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Expanded(
                                child: Text(
                                  '0.00',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 56, 56, 56),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 160,
                      height: 50,
                      color: const Color.fromARGB(0, 255, 235, 59),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Deposito adicional',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 56, 56, 56),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 75,
                      color: const Color.fromARGB(0, 255, 11, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Expanded(
                                child: Text(
                                  '0.00',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 56, 56, 56),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 160,
                      height: 50,
                      color: const Color.fromARGB(0, 255, 235, 59),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Saldo Financiar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 56, 56, 56),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 75,
                      color: const Color.fromARGB(0, 255, 11, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Expanded(
                                child: Text(
                                  '0.00',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 56, 56, 56),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 160,
                      height: 50,
                      color: const Color.fromARGB(0, 255, 235, 59),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Tasa de interés vigente',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 56, 56, 56),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 75,
                      color: const Color.fromARGB(0, 255, 11, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Expanded(
                                child: Text(
                                  '1.30% MV',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 56, 56, 56),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //////////////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 160,
                      height: 50,
                      color: const Color.fromARGB(0, 255, 235, 59),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'N° de inversiones',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 56, 56, 56),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 75,
                      color: const Color.fromARGB(0, 255, 11, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Expanded(
                                child: Text(
                                  'X',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 56, 56, 56),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 160,
                      height: 50,
                      color: const Color.fromARGB(0, 255, 235, 59),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Pago mínimo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 56, 56, 56),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 75,
                      color: const Color.fromARGB(0, 255, 11, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Expanded(
                                child: Text(
                                  '0.00',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 56, 56, 56),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Save button pressed
        },
        label: Text('Guardar Orden'),
        icon: Icon(Icons.save),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
