import 'package:flutter/material.dart';
import 'package:mentimeterclone/Presentations/Host/CreateQuest.dart';
import 'package:mentimeterclone/Presentations/Participants/JoinQuest.dart';
import 'package:mentimeterclone/Widgets/CustomButton.dart';

class HomePage extends StatelessWidget {

  static String routeName = 'home-page';
  const HomePage({Key? key}) : super(key: key);

  void joinQuest(BuildContext context){
    Navigator.pushNamed(context, JoinQuest.routeName);
  }

  void createQuest(BuildContext context){
    Navigator.pushNamed(context, CreateQuest.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(onTap: () => joinQuest(context), text: "Join Quest"),
          const SizedBox(height: 20),
          CustomButton(onTap: () => createQuest(context), text: "Host Quest")
        ],
      ),
    );
  }
}