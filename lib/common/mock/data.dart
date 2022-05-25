import 'package:ws_chat_flutter/common/entities/index.dart';

class Data {
  static var mockGroupInfoMap = {
    "39_40": {
      "aliasName": "flutter",
      "avatarUrl": "https://s1.ax1x.com/2022/05/19/Oq3yDg.jpg",
    },
    "39_41": {
      "aliasName": "python",
      "avatarUrl": "https://s1.ax1x.com/2022/05/19/Oq3fCq.jpg",
    },
    "39_42": {
      "aliasName": "golang",
      "avatarUrl": "https://s1.ax1x.com/2022/05/19/Oq3h80.jpg",
    },
    "39_43": {
      "aliasName": "ruby",
      "avatarUrl": "https://s1.ax1x.com/2022/05/19/Oq3TrF.jpg",
    },
    "39_44": {
      "aliasName": "C++",
      "avatarUrl": "https://s1.ax1x.com/2022/05/19/Oq8API.jpg",
    },
  };

  // 消息页
  static List<ChatMsg> mockMessageList = [
    ChatMsg(
      groupId: "39_40",
      senderId: 1,
      type: 1,
      content: "一套代码支持全平台",
      uuid: "123",
      createTime: 1652973045000,
    ),
    ChatMsg(
      groupId: "39_41",
      senderId: 2,
      type: 1,
      content: "hello world",
      uuid: "123",
      createTime: 1652973046000,
    ),
    ChatMsg(
      groupId: "39_42",
      senderId: 3,
      type: 2,
      content: "[图片]",
      uuid: "123",
      createTime: 1652973047000,
    ),
    ChatMsg(
      groupId: "39_43",
      senderId: 4,
      type: 1,
      content: "通过通信来共享内存, 而非共享内存来通信",
      uuid: "123",
      createTime: 1652973048000,
    ),
    ChatMsg(
      groupId: "39_44",
      senderId: 5,
      type: 1,
      content: "欢迎来到微信",
      uuid: "123",
      createTime: 1652973049000,
    ),
  ];

  // 聊天详情
  static List<ChatMsg> mockchatMessageList = [
    ChatMsg(
      groupId: "39_40",
      senderId: 1,
      type: 1,
      content: "一套代码支持全平台",
      uuid: "123",
      createTime: 1652973045000,
    ),
    ChatMsg(
      groupId: "39_41",
      senderId: 2,
      type: 1,
      content: "hello world",
      uuid: "123",
      createTime: 1652973046000,
    ),
    ChatMsg(
      groupId: "39_41",
      senderId: 3,
      type: 2,
      content: "[图片]",
      uuid: "123",
      createTime: 1652973047000,
    ),
    ChatMsg(
      groupId: "39_41",
      senderId: 4,
      type: 1,
      content: "通过通信来共享内存, 而非共享内存来通信",
      uuid: "123",
      createTime: 1652973048000,
    ),
    ChatMsg(
      groupId: "39_41",
      senderId: 5,
      type: 1,
      content: "欢迎来到微信",
      uuid: "123",
      createTime: 1652973049000,
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
