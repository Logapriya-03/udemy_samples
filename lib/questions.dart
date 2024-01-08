import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy_samples/answers_button.dart';
import 'package:udemy_samples/data/questions_answers.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key,required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 70,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    currentQuestion.questions,
                    style: GoogleFonts.aBeeZee(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ...currentQuestion.getShuffledList().map((value) {
              return AnswersButton(
                  answerText: value,
                  onTap: (){
                    answerQuestion(value);
                  } );
            })
            // AnswersButton(answerText: currentQuestion.answers[0], onTap:(){} ),
            // AnswersButton(answerText: currentQuestion.answers[1], onTap:(){} ),
            // AnswersButton(answerText: currentQuestion.answers[2], onTap:(){} ),
            // AnswersButton(answerText: currentQuestion.answers[3], onTap:(){} ),
          ],
        ),
      ),
    );
  }
}
