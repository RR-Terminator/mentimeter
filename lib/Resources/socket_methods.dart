import 'package:flutter/cupertino.dart';
import 'package:mentimeterclone/Providers/room_data_provider.dart';
import 'package:mentimeterclone/Resources/socket_client.dart';
import 'package:provider/provider.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;
//emits :
  void createQuest(String adminName) {
    _socketClient.emit('createQuest', {'AdminName': adminName});
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
    print("this wa clicked");
    _socketClient.emit('joinRoom', {
      'UserName': userName,
      'roomId': roomId,
    });
  }


  void deleteQuestion(int index) {
    _socketClient.emit('deleteQuestion', {'index': index});
  }

  // Listeners :

  void createQuestSuccessListener(BuildContext context) {
    _socketClient.on('RoomCreated', (savedAdmin) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(savedAdmin);
    });
  }

  void joinRoomSuccessListener(BuildContext context) {
    _socketClient.on('PlayerJoined', (savedAdmin) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(savedAdmin);
    });
  }

  void deleteQuestionSuccessListener(BuildContext context){
    _socketClient.on('RoomUpdated', (savedAdmin) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(savedAdmin);
    });
  }



}
