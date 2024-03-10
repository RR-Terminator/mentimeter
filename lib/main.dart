import 'package:flutter/material.dart';
import 'package:mentimeterclone/Presentations/HomePage.dart';
import 'package:mentimeterclone/Presentations/Host/CreateQuest.dart';
import 'package:mentimeterclone/Presentations/Host/HostQuestions.dart';
import 'package:mentimeterclone/Presentations/Host/QuestionReviewPage.dart';
import 'package:mentimeterclone/Presentations/Host/WaitingScreen.dart';
import 'package:mentimeterclone/Presentations/LeaderBoardScreen.dart';
import 'package:mentimeterclone/Presentations/Participants/JoinQuest.dart';
import 'package:mentimeterclone/Presentations/Participants/QuestionPage.dart';
import 'package:mentimeterclone/Presentations/Participants/WaitingScreen.dart';

import 'package:mentimeterclone/Presentations/WinnerScreen.dart';
import 'package:mentimeterclone/Providers/room_data_provider.dart';
import 'package:provider/provider.dart';

void main(){

  runApp(ChangeNotifierProvider<RoomDataProvider>(
    create: (context) => RoomDataProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName : (context) =>const HomePage(),
        JoinQuest.routeName : (context) => const JoinQuest(),
        CreateQuest.routeName : (context) => const CreateQuest(),
        QuestionPage.routeName : (context) => const QuestionPage(),
        AddQuestions.routeName : (context) => const AddQuestions(),
        ReviewPage.routeName: (context) => const ReviewPage(),
        HostWaitingScreen.routeName : (context) => const HostWaitingScreen(),
        LeaderBoard.routeName : (context) => const LeaderBoard(),
        WinnerScreen.routeName: (context) => const WinnerScreen(),
        ParticipantWaitingScreen.routeName  : (context) => const ParticipantWaitingScreen(participantName: '',),

    
    
    
      },
    
    ),
  ));
}