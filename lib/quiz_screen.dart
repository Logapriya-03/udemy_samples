import 'package:flutter/material.dart';
import 'package:udemy_samples/data/questions_answers.dart';
import 'package:udemy_samples/questions.dart';
import 'package:udemy_samples/results_screen.dart';
import 'package:udemy_samples/start_screen.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length==questions.length){
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results-screen';
      });

    }


  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen== 'questions-screen'){
        screenWidget  = QuestionPage(
          onSelectedAnswer: chooseAnswer,
        );
    }

    if (activeScreen== 'results-screen'){
      screenWidget  = ResultsScreen(chosenAnswers: selectedAnswers,);
    }


    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 53, 81, 168),
                Color.fromARGB(255, 241, 190, 16),
              ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
          child: screenWidget,
      ),
    );
  }
}
