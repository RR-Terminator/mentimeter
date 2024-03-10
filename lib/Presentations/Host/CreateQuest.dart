// import 'package:flutter/material.dart';
// import 'package:mentimeterclone/Presentations/Host/HostQuestions.dart';
// import 'package:mentimeterclone/Resources/socket_methods.dart';
// import 'package:mentimeterclone/Widgets/CustomButton.dart';
// import 'package:mentimeterclone/Widgets/NameField.dart';
//
// class CreateQuest extends StatefulWidget {
//
//   static String routeName= '/create-room' ;
//   const CreateQuest({Key? key}) : super(key: key);
//
//   @override
//   State<CreateQuest> createState() => _CreateQuestState();
// }
//
// class _CreateQuestState extends State<CreateQuest> {
//
//
//   final TextEditingController _nameController = TextEditingController();
//   final SocketMethods _socketMethods = SocketMethods();
//
//   @override
//   void initState() {
//     super.initState();
//     _socketMethods.createQuestSuccessListener(context);
//   }
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     super.dispose();
//   }
//
//   void createRoom(BuildContext context) {
//     Navigator.push(context, MaterialPageRoute(builder: (context) =>  const AddQuestions()));
//     _socketMethods.createQuest(_nameController.text);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CustomTextField(controller: _nameController, hintText: 'Enter Your Name'),
//           const SizedBox(height: 40),
//           CustomButton(onTap: () => createRoom(context), text: "Click Here To Create"),
//         ],
//       ),
//     );
//   }
// }
