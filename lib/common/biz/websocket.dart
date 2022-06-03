import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:web_socket_channel/io.dart';
import 'package:wechat_flutter/common/entities/index.dart';

typedef OnRecvCallBack = Function(String msg);

// 抽象层封装：提取通用socket 功能
abstract class ISocket {
  // 建立连接
  ISocket open();

  // 发送弹幕
  ISocket send(String message);

  // 接收数据
  ISocket listen(String message);

  // 关闭连接
  void close();
}

class WsSocket extends ISocket {
  final Map<String, dynamic>? headers;

  static const _URL = "ws://101.42.134.18:10002/ws";

  late IOWebSocketChannel _channel;

  WsSocket({this.headers});

  // 建立连接
  @override
  ISocket open() {
    _channel = IOWebSocketChannel.connect(_URL, headers: headers);
    _channel.stream.handleError((error) {
      print('连接发生错误：$error');
    }).listen((event) {
      // 接收数据
      print('接收到消息：$event');
    });
    return this;
  }

  // 监听服务端返回的数据
  @override
  ISocket listen(String message) {
    print('listen $message');
    // var jsonStr = jsonDecode(message);
    // var chatMsg = ChatMsg.fromJson(jsonStr);

    return this;
  }

  // 向服务端发送消息
  @override
  ISocket send(String message) {
    print('send $message');
    _channel.sink.add(message);
    return this;
  }

  // 关闭连接
  @override
  void close() {
    print('close');
    _channel.sink.close();
  }
}
