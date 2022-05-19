import 'package:ws_chat_flutter/common/entities/message.dart';

class Data {
  static var senderInfoMap = {
    1: {
      "nickName": "flutter",
      "avatar": "https://s1.ax1x.com/2022/05/19/Oq3yDg.jpg",
    },
    2: {
      "nickName": "python",
      "avatar": "https://s1.ax1x.com/2022/05/19/Oq3fCq.jpg",
    },
    3: {
      "nickName": "golang",
      "avatar": "https://s1.ax1x.com/2022/05/19/Oq3h80.jpg",
    },
    4: {
      "nickName": "ruby",
      "avatar": "https://s1.ax1x.com/2022/05/19/Oq3TrF.jpg",
    },
    5: {
      "nickName": "C++",
      "avatar": "https://s1.ax1x.com/2022/05/19/Oq8API.jpg",
    },
  };

  static List<ChatMsg> mockMessageList = [
    ChatMsg(
      groupId: 1,
      senderId: 1,
      type: 2,
      content: "一套代码支持全平台",
      uuid: "123",
      createTime: 1652973045,
    ),
    ChatMsg(
      groupId: 1,
      senderId: 2,
      type: 2,
      content: "hello world",
      uuid: "123",
      createTime: 1652973046,
    ),
    ChatMsg(
      groupId: 1,
      senderId: 3,
      type: 2,
      content: "[图片]",
      uuid: "123",
      createTime: 1652973047,
    ),
    ChatMsg(
      groupId: 1,
      senderId: 4,
      type: 2,
      content: "通过通信来共享内存, 而非共享内存来通信",
      uuid: "123",
      createTime: 1652973048,
    ),
    ChatMsg(
      groupId: 1,
      senderId: 5,
      type: 2,
      content: "欢迎来到微信",
      uuid: "123",
      createTime: 1652973049,
    ),
  ];

  static Map contact = {
    "first": [],
    "G": [
      {
        "avator": "assets/images/avator3.jpg",
        "nickName": "Golang",
        "pinyin": "golang"
      }
    ],
    "F": [
      {
        "avator": "assets/images/avator1.jpg",
        "nickName": "Flutter",
        "pinyin": "flutter"
      }
    ],
    "P": [
      {
        "avator": "assets/images/avator2.jpg",
        "nickName": "Python",
        "pinyin": "python"
      }
    ],
    "W": [
      {
        "avator": "assets/images/file.jpg",
        "nickName": "文件传输助手",
        "pinyin": "wenjianchuanshuzhushou"
      },
      {
        "avator": "assets/images/icon.png",
        "nickName": "微信团队",
        "pinyin": "weixintuandui"
      },
    ],
  };
}
