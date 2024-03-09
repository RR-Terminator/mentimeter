import 'package:flutter/material.dart';
import 'package:mentimeterclone/Widgets/CustomButton.dart';
import 'package:mentimeterclone/Widgets/NameField.dart';

class CreateQuest extends StatefulWidget {

  static String routeName= '/create-room' ;
  const CreateQuest({Key? key}) : super(key: key);

  @override
  State<CreateQuest> createState() => _CreateQuestState();
}

class _CreateQuestState extends State<CreateQuest> {


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomId = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(controller: _nameController, hintText: 'Enter Your Name'),
          const SizedBox(height: 40),
          CustomButton(onTap: () => {}, text: "Click Here To Create"),
        ],
      ),
    );
  }
}
