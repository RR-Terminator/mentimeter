
import 'package:flutter/cupertino.dart';
import 'package:mentimeterclone/Resources/socket_client.dart';


class SocketMethods{
  final _socketClient = SocketClient.instance.socket!;
//emits :
  void createQuest(String adminName) {
    _socketClient
        .emit('createQuest', {'AdminName': adminName});
  }
  void addQuestion(String question, Map<String, String> options, String answer) {
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




}