import 'package:flutter/material.dart';
import 'package:quiz_app_2/data/Questions.dart';
import 'package:quiz_app_2/homepage.dart';
import 'package:quiz_app_2/question.dart';
import 'package:quiz_app_2/resultScreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = Result(selectedAnswers, restart);
      });
    }
  }

  restart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = HomePage(switchScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = HomePage(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = Questions(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: activeScreen,
    );
  }
}
