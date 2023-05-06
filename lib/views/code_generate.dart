import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animated_background/animated_background.dart';

class Code_Gen extends StatefulWidget {
  const Code_Gen({super.key});

  @override
  State<Code_Gen> createState() => _Code_GenState();
}

class _Code_GenState extends State<Code_Gen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Código'),
        backgroundColor: Color.fromARGB(255, 7, 77, 228),
      ),
      body: Container(
        child: AnimatedBackground(
          behaviour: BubblesBehaviour(),
          vsync: this,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Logo.jpeg', width: 300),
                  SizedBox(height: 20),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Introduce tu código',
                        textStyle: TextStyle(fontSize: 20),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Ingresa tu código...',
                      hintStyle:
                          TextStyle(fontSize: 20, color: Colors.grey[400]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 212, 175, 175),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 189, 189, 189),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.numbers,
                        color: Color.fromARGB(255, 1, 26, 255),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  InkResponse(
                    onTap: () {
                      // Aquí puedes poner el código que se ejecuta al pulsar el botón
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 6, 7, 82),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
