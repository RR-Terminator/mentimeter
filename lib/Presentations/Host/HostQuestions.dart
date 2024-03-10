import 'package:flutter/material.dart';
import 'package:mentimeterclone/Presentations/Host/QuestionReviewPage.dart';
import 'package:mentimeterclone/Resources/socket_methods.dart';

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
  final SocketMethods _socketMethods = SocketMethods();


  void addQuestion() {

    Map<String, String> options = {};
    optionControllers.forEach((key, controller) {
      options[key] = controller.text;
    });
    _socketMethods.addQuestion(_question.text, options, _rightOption.text);
    for (var controller in optionControllers.values) {
      controller.clear();
    }
    _question.clear();
    _rightOption.clear();

  }




  void submitData() {
    Map<String, String> options = {};
    optionControllers.forEach((key, controller) {
      options[key] = controller.text;
    });
    _socketMethods.addQuestion(_question.text, options, _rightOption.text);
    Navigator.pushNamed(context, ReviewPage.routeName);
  }


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
                    onPressed: () => submitData(),
                    child: const Text('Submit'),
                  ),
                  ElevatedButton(
                    onPressed: () => addQuestion(),
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
