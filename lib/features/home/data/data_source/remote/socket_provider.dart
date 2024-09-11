
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketProvider {
  IO.Socket? connectSocket() {

    print("start connecting socket...");

    return IO.io('https://6a3e-3-79-148-80.ngrok-free.app', <String, dynamic>{
      'transports': ['websocket'],
    });
  }
}
