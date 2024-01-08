import 'package:flutter/material.dart';

import 'dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

void main() {
  runApp( const MaterialApp(
      home: Scaffold(
        body: MyApp(),
      )
  )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 53, 81, 168),
                Color.fromARGB(255, 241, 190, 16),
              ],
              begin: startAlignment,
              end: endAlignment,
            )),
        child:const Center(
          child: DiceRoller(),
        ) ,
      ),
    );
  }
}
