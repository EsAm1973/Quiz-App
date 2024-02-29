import 'package:flutter/material.dart';

class answerButtom extends StatelessWidget {
  final String TextAnswer;
  final Function() on_Pressed;

  const answerButtom(
      {super.key, required this.TextAnswer, required this.on_Pressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.all(25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      onPressed: on_Pressed,
      child: Text(
        TextAnswer,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
