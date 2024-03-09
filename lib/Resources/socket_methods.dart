import 'package:flutter/cupertino.dart';
import 'package:mentimeterclone/Resources/socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

//emits :

  void createQuest(String adminName, String roomId) {
    _socketClient
        .emit('createQuest', {'AdminName': adminName, 'roomId': roomId});
  }

  void addQuestion(
      String question, Map<String, String> options, String answer) {
    List<String> optionList = [];
    optionList.addAll(options.values);
    _socketClient.emit('addQuestion', {
      'question': question,
      'Options': optionList,
      'correctOption': answer,
    });
  }

  void joinRoom(String userName, String roomId) {
    _socketClient.emit('joinRoom', {
      'UserName': userName,
      'roomId': roomId,
    });
  }

  // Listeners :

  void createQuestSuccessListener(BuildContext context) {
    _socketClient.on('RoomCreated', (savedAdmin) {
      print(savedAdmin);
      // Handle the 'Room Created' event data here
      // Provider.of<RoomDataProvider>(context, listen: false)
      //     .updateRoomData(savedAdmin);
      // You can perform actions based on the received data
    });
  }
}
