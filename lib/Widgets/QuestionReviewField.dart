import 'package:flutter/material.dart';

class QuestionTile extends StatelessWidget {

  final String question;
  final List<dynamic> options;
  final String rightOption;
  const QuestionTile({Key? key , required this.question, required this.options, required this.rightOption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        question,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Options: $options',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            'Correct Option: $rightOption',
            style: TextStyle(fontSize: 14, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
