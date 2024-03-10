import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  // Private constructor
  SocketClient._internal() {
    socket = IO.io('http://192.168.0.103:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();

  }

  static SocketClient get instance{
    _instance ??=   SocketClient._internal();
    return _instance!;
  }
}