import 'package:flutter/material.dart';

class QuestionTile extends StatelessWidget {
  final String question;
  final List<dynamic> options;
  final String rightOption;
  final VoidCallback onTap;

  const QuestionTile(
      {Key? key,
      required this.question,
      required this.options,
      required this.rightOption,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          "Question : $question",
          style: const TextStyle(fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Options: $options',
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              'Correct Option: $rightOption',
              style: const TextStyle(fontSize: 14, color: Colors.green),
            ),
            InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
