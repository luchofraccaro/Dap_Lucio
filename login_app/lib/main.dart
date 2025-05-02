//import 'dart:collection';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool text = true;
  bool ocultar = true;
  String ocultar_icono = "🙈";
  String ocultar_icono1 = "🐵";
  String ocultar_icono2 = "🙈";
  TextEditingController controler1 = TextEditingController();
  TextEditingController controler2 = TextEditingController();
  String user1 = "LUCHO";
  String pass1 = "L2025";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const Text('Usuario')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 200, child: TextField(controller: controler1)),
              ],
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const Text('Contraseña')],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(controller: controler2, obscureText: ocultar),
                ),
                ElevatedButton(onPressed: (){setState(() {
                      ocultar = !ocultar;
                      ocultar_icono = ocultar ? ocultar_icono1 : ocultar_icono2;
                    });
                  }, child: Text(ocultar_icono))
              ],

            ),

            SizedBox(height: 20), // Espacio entre el TextField y el botón
            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón
                String usuario = controler1.text;
                String contra = controler2.text;

                if (usuario == user1 && contra == pass1) {
                  //CORRECTO
                  print("IENVENIIDO");
                  print("Usuario ingresado: $usuario");
                  print("Contraseña ingresado: $contra");
                  controler1.clear();
                  controler2.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Pagina_bienvenido(),
                    ),
                  );
                } else if (controler1.text.isEmpty == true ||
                    controler2.text.isEmpty == true) {
                  print("USUARIO y/o CONTRA VACIA");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Usuario y/o contraseña no ingresados"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else if (usuario != user1 || contra != pass1) {
                  print("INCORRECTO"); 
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Usuario y/o contraseña no válidos"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  controler1.clear();
                  controler2.clear();
                }
              },
              child: Text('Ingresar'),
            ),
          ],
        ),
      ),
    );
  }
}

class Pagina_bienvenido extends StatelessWidget {
  const Pagina_bienvenido({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MI app')),
      body: Center(
        child: const Text('¡Bienvenido!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
