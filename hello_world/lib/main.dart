import 'package:flutter/material.dart';

void main() {
  runApp(
     MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

 @override
  _MainAppState createState() => _MainAppState();
}


  
class _MainAppState extends State<MainApp> {
  bool text = true;
  double size_text = 10;
  Color color_text = Colors.black;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(text == true)  Text('HOLA', style: TextStyle(fontSize:size_text,color: color_text)
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('Ocultar');
                          setState(() {
                          text = false;  
                          });
                        },
                        child: const Text('Ocultar'),
                      ),
                      const SizedBox(height: 3),
                      ElevatedButton(
                        onPressed: () {
                          print('Agrandar');
                          setState(() {
                          size_text += 2;  
                          });
                        },
                        child: const Text('+'),
                      ),
                    const SizedBox(height: 3),
                      ElevatedButton(
                        onPressed: () {
                          print('AZUL');
                          setState(() {
                          color_text = Colors.blue;  
                          });
                        },
                        child: const Text('AZUL'),
                      ),
                    ]
                  ),
                   const SizedBox(width: 20),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('Mostrar');
                          setState(() {
                            text = true;
                          });
                        },
                        child: const Text('Mostar'),
                      ),
                      const SizedBox(height: 3),
                      ElevatedButton(
                        onPressed: () {
                          print('Achicar');
                          setState(() {
                            size_text = (size_text -2).clamp(10.0, 50.0);
                          });                          
                        },
                        child: const Text('-'),
                      ),
                      const SizedBox(height: 3),
                      ElevatedButton(
                        onPressed: () {
                          print('Negro');
                          setState(() {
                          color_text = Colors.black;  
                          });
                        },
                        child: const Text('NEGRO'),
                      ),
                    ]
                    

                  ),
                ],

              )
            ]
      ),
    )
    )
    );
  }
}