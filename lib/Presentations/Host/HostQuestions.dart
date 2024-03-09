import 'package:flutter/material.dart';

class AddQuestions extends StatefulWidget {

  static String routeName = '/add-questions' ;
  const AddQuestions({Key? key}) : super(key: key);

  @override
  State<AddQuestions> createState() => _QueAddQuestionsState();
}

class _QueAddQuestionsState extends State<AddQuestions> {

  final TextEditingController _question = TextEditingController();
  Map<String, TextEditingController> optionControllers = {
    'Option 1': TextEditingController(),
    'Option 2': TextEditingController(),
    'Option 3': TextEditingController(),
    'Option 4': TextEditingController(),
  };

  final TextEditingController _rightOption = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Questions To The Quiz'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _question,
              ),
              const SizedBox(height: 30),
              for (var entry in optionControllers.entries)
                TextField(
                  controller: entry.value,
                  decoration: InputDecoration(labelText: entry.key),
                ),
              const SizedBox(height: 16),
              TextField(
                controller: _rightOption,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Submit'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Next'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
