import 'dart:async';

import 'package:flutter/material.dart';

import 'dart:math';

import 'package:udemy_samples/quiz_screen.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {

  Random random = Random();
  int currentImageIndex  =0;
  // var activeDiceImage = 'assets/dice-2.png';
  int counter = 1;
  List<String> images = [
    'assets/dice-1.png',
    'assets/dice-2.png',
    'assets/dice-3.png',
    'assets/dice-4.png',
    'assets/dice-5.png',
    'assets/dice-6.png',
  ];

  // void rollDice() {
  //   var diceRoll = Random().nextInt(6) + 1;
  //   setState(() {
  //     activeDiceImage = 'assets/dice-$diceRoll.png';
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.rotate(
          angle: random.nextDouble() * 20,
          child: Image.asset(
            images[currentImageIndex],
            width: 180,
            height: 180,
          ),
        ),
        const SizedBox(height: 80),
        Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 15, 41, 128)

              ),
                onPressed: () async{
              Timer.periodic(const Duration(milliseconds: 80), (timer) {
                counter++;
                setState(() {
                  currentImageIndex = random.nextInt(6);
                });
                if(counter>13){
                  timer.cancel();
                  setState(() {
                    counter = 1;
                  });
                }
              });
              
            }, child: Text('Roll dice',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white
              ),
            )),
            SizedBox(
              height: 60.0,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                 color: Colors.black26
                  ),
              child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                label: const Icon(Icons.arrow_circle_right_outlined),
                icon: Text('Go to Quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                ),
                ),
                 ),
            ),
          ],
        )
      ],
    );
  }
}
