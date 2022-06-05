import 'package:web_socket_channel/io.dart';

typedef OnListen = void Function(dynamic);
typedef OnError = Function;

class WsSocket {
  late IOWebSocketChannel _channel;
  static const _URL = "ws://101.42.134.18:10002/ws";
  final Map<String, dynamic>? headers;
  OnListen? onListen;
  OnError onError;

  WsSocket({this.headers, this.onListen, required this.onError});

  // 开始监听
  start() {
    _channel = IOWebSocketChannel.connect(_URL, headers: headers);
    _channel.stream.listen(onListen);
    _channel.stream.handleError(onError);
  }

  // 向服务端发送消息
  send(String message) {
    _channel.sink.add(message);
  }

  // 关闭连接
  close() {
    _channel.sink.close();
  }
}
