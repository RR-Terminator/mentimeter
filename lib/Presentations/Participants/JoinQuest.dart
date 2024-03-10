import 'package:flutter/material.dart';
import 'package:mentimeterclone/Presentations/Participants/WaitingScreen.dart';
import 'package:mentimeterclone/Resources/socket_methods.dart';
import 'package:mentimeterclone/Widgets/CustomButton.dart';
import 'package:mentimeterclone/Widgets/NameField.dart';

class JoinQuest extends StatefulWidget {
  static String routeName = '/join-quest';
  const JoinQuest({Key? key}) : super(key: key);

  @override
  State<JoinQuest> createState() => _JoinQuestState();
}

class _JoinQuestState extends State<JoinQuest> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomId = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();


  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
  }


  @override
  void dispose() {
    _nameController.dispose();
    _roomId.dispose();
    super.dispose();
  }

  void joinQuest() {
    _socketMethods.joinRoom(_nameController.text, _roomId.text);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ParticipantWaitingScreen(participantName: _nameController.text),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextField(
            controller: _nameController, hintText: 'Enter Your Name'),
        const SizedBox(height: 20),
        CustomTextField(controller: _roomId, hintText: 'Enter Room Number'),
        const SizedBox(height: 40),
        CustomButton(onTap: () => joinQuest(), text: "Click Here To Enter")
      ],
    ));
  }
}
