import 'package:flutter/material.dart';
import 'package:quiz_app_2/Summary.dart';
import 'package:quiz_app_2/data/Questions.dart';

class Result extends StatelessWidget {
  const Result(this.selectedAnswers, this.restart, {super.key});

  final List<String> selectedAnswers;
  final Function() restart;
  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> Summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      Summary.add({
        'questionIndex': i,
        'questions': questions[i].Text,
        'correctAnswer': questions[i].Answers[0],
        'userAnswer': selectedAnswers[i],
      });
    }
    return Summary;
  }

  @override
  Widget build(BuildContext context) {
    final SummaryDate = getSummary();
    var numOfCorrectAnswers = 0;
    for (int i = 0; i < SummaryDate.length; i++) {
      if (SummaryDate[i]['userAnswer'] == SummaryDate[i]['correctAnswer']) {
        numOfCorrectAnswers++;
      }
    }

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.blue.shade600,
          Colors.blue.shade900,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      )),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your answerd ${numOfCorrectAnswers} out of ${questions.length} questions correctly",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          Summary(SummaryDate),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.restart_alt_outlined),
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onPressed: restart,
            label: const Text(
              'Restart Quiz',
              style: TextStyle(fontSize: 25),
            ),
          )
        ],
      ),
    ));
  }
}
