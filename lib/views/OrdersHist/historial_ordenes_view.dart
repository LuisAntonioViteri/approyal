import 'package:flutter/material.dart';

class ContVentas extends StatefulWidget {
  const ContVentas({Key? key}) : super(key: key);

  @override
  _ContVentasState createState() => _ContVentasState();
}

class _ContVentasState extends State<ContVentas> {
  bool? _agree = false;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final EdgeInsets padding = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial Ventas'),
        backgroundColor: const Color.fromARGB(255, 7, 77, 228),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(
            (screenSize.width * 0.05) - padding.left, // margen izquierdo
            (screenSize.height * 0.1) - padding.top, // margen superior
            (screenSize.width * 0.05) - padding.right, // margen derecho
            (screenSize.height * 0.05) - padding.bottom, // margen inferior
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  const Color.fromARGB(255, 179, 14, 14), // color de la línea
              width: 2.0, // grosor de la línea
              style: BorderStyle.solid, // estilo de la línea
            ),
          ),
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
                          Text(
                            'Nombre Apellido',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 56, 56, 56),
                            ),
                          ),
                          const SizedBox(height: 1),
                          const Text(
                            'DD/MM/AAAA',
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
                      height: 50,
                      color: const Color.fromARGB(0, 255, 235, 59),
                      child: const Center(
                        child: Text(
                          'Ivonne sarten',
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
                      height: 100,
                      color: const Color.fromARGB(0, 240, 15, 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Expanded(
                                child: Text(
                                  '999.99',
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
                      child: const Center(
                        child: Text(
                          'cuchillos 34jd',
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
                      height: 100,
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
                          'Cuchillos',
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
                      height: 100,
                      color: const Color.fromARGB(0, 255, 11, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Expanded(
                                child: Text(
                                  '0.01',
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
                          'Cuchillos',
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
                      height: 100,
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
                          'Cuchillos',
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
                      height: 100,
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
                          'Cuchillos',
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
                      height: 100,
                      color: const Color.fromARGB(0, 255, 11, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Expanded(
                                child: Text(
                                  'Cuchillos',
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
                          'Cuchillos',
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
                      height: 100,
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
                          'Cuchillos',
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
                      height: 100,
                      color: const Color.fromARGB(0, 255, 11, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Expanded(
                                child: Text(
                                  '1.30',
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
                          'Cuchillos',
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
                      height: 100,
                      color: const Color.fromARGB(0, 255, 11, 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Expanded(
                                child: Text(
                                  '0.001',
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
                          'Cuchillos',
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
                      height: 100,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 140,
                      height: 50,
                      color: const Color.fromARGB(255, 165, 165, 165),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          '\$100.00    ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 56, 56, 56),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 50,
                      color: const Color.fromARGB(255, 165, 165, 165),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          '   \$20.00',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 56, 56, 56),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
