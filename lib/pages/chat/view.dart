import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat_flutter/common/style/icons.dart';
import 'package:wechat_flutter/common/widgets/app_bar.dart';
import 'package:wechat_flutter/common/widgets/chat_content.dart';
import 'package:wechat_flutter/pages/message/controller.dart';
import 'package:wechat_flutter/pages/mine/controller.dart';

import 'controller.dart';

class ChatPage extends StatelessWidget {
  final String tag;
  final ChatController controller;
  ChatPage({Key? key, required this.tag})
      : controller = Get.put(ChatController(), tag: tag, permanent: true),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: BuildAppBar(controller.aliasName),
      body: GestureDetector(
        // behavior: HitTestBehavior.translucent,
        child: SafeArea(
          child: Column(
            children: [
              chatView(),
              inputView(),
            ],
          ),
        ),
      ),
    );
  }

  // 聊天内容显示
  Widget chatView() {
    return Expanded(
        child: GetBuilder<ChatController>(
            tag: tag,
            builder: (controller) => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                itemCount: controller.groupMsgList.length,
                itemBuilder: (context, index) {
                  final chatMsg = controller.groupMsgList[index];
                  var senderId = chatMsg.senderId;
                  var groupId = chatMsg.groupId;
                  var groupInfo =
                      MessageController.to.messageGroupInfoMap[groupId]!;
                  bool isSelf;
                  String avatar;
                  String userName;
                  if (senderId == MineController.to.userId) {
                    isSelf = true;
                    avatar = MineController.to.avatarUrl;
                    userName = MineController.to.nickName;
                  } else {
                    isSelf = false;
                    avatar = groupInfo.avatarUrl;
                    userName = groupInfo.aliasName;
                  }
                  return ChatContentView(
                    isSelf: isSelf,
                    text: chatMsg.content,
                    avatar: avatar,
                    username: userName,
                    type: chatMsg.type,
                  );
                })));
  }

  // 最下方的输入框部分
  Widget inputView() {
    return Container(
      padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 5.0, right: 5.0),
      color: Color(0xFFF7F7F7),
      child: Row(
        children: [
          Container(
            width: 40.0,
            margin: EdgeInsets.only(right: 10.0),
            child: IconButton(
                icon: Icon(ICons.VOICE),
                onPressed: () {
                  print('切换到语音');
                }),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            height: 40.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: Colors.white),
            child: GetBuilder<ChatController>(
                tag: tag,
                builder: (controller) => TextField(
                    controller: controller.inputController,
                    decoration: InputDecoration.collapsed(hintText: null),
                    maxLines: 1,
                    autocorrect: true,
                    autofocus: false,
                    style: TextStyle(fontSize: 20, color: Color(0xFF333333)),
                    textAlign: TextAlign.start,
                    cursorColor: Colors.green,
                    onSubmitted: (text) {
                      print("onSubmitted");
                    })),
          )),
          SizedBox(
            width: 40.0,
            child: IconButton(
                icon: Icon(ICons.FACES), //发送按钮图标
                onPressed: () {
                  print('打开表情面板');
                }),
          ),
          SizedBox(
            width: 40.0,
            child: GetBuilder<ChatController>(
                tag: tag,
                builder: (controller) => IconButton(
                    //发送按钮或者+按钮
                    icon: Icon(Icons.send), //发送按钮图标
                    onPressed: controller.sendMsg)),
          )
        ],
      ),
    );
  }
}
