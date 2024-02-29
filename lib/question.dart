import 'package:flutter/material.dart';
import 'package:quiz_app_2/answer_button_style.dart';
import 'data/Questions.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Questions extends StatefulWidget {
  Questions(this.onSelectedAnswer, {super.key});
  void Function(String) onSelectedAnswer;
  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var currentQuestionIndex = 0;

  void NewQuestion(String answer) {
    setState(() {
      widget.onSelectedAnswer(answer);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.blue.shade600,
            Colors.blue.shade900,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/light.png',
                height: 200,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                currentQuestion.Text,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              ...currentQuestion.getShuffeledAnswers().map((e) {
                return Container(
                    margin: const EdgeInsets.all(10),
                    child: answerButtom(
                        TextAnswer: e, on_Pressed: () => NewQuestion(e)));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
