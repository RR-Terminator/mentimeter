import 'package:flutter/material.dart';
import 'package:mentimeterclone/Providers/room_data_provider.dart';
import 'package:provider/provider.dart';

class ParticipantWaitingScreen extends StatefulWidget {
  static String routeName = '/part-waiting-screen';

  final String participantName;

  const ParticipantWaitingScreen({Key? key, required this.participantName})
      : super(key: key);

  @override
  State<ParticipantWaitingScreen> createState() =>
      _ParticipantWaitingScreenState();
}

class _ParticipantWaitingScreenState extends State<ParticipantWaitingScreen> {
  @override
  Widget build(BuildContext context) {

    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Welcome  to The Quest Quest Host Name: ${roomDataProvider.roomData['adminName']}"),
          const Center(
            child: Icon(Icons.account_circle, size: 300),
          ),
          const SizedBox(height: 30),
          Text(
              "Hello ${widget.participantName},  waiting for the Host to start The Quest"),
        ],
      ),
    );
  }
}
