import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/entities/index.dart';
// import 'package:ws_chat_flutter/common/mock/data.dart';
import 'package:ws_chat_flutter/common/utils/timex.dart';
import 'package:ws_chat_flutter/common/widgets/app_bar.dart';
import 'package:ws_chat_flutter/pages/home/views/chat.dart';

import '../controller.dart';

class MessagePage extends GetView<HomeController> {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: HeaderBar.BuildAppBar("消 息"),
      body: SizedBox(
        height: size.height,
        child: ListView.builder(
            itemCount: controller.messageState.messageGroupList.length,
            itemBuilder: (context, index) {
              ChatMsg chatMsg = controller.messageState.messageGroupList[index];
              var groupId = chatMsg.groupId;
              var groupInfo =
                  controller.messageState.messageGroupInfoMap[groupId]!;
              var time_format = timeStampToString(chatMsg.createTime);
              return buildMessageItem(groupId, chatMsg.id, groupInfo["avatarUrl"]!,
                  groupInfo["aliasName"]!, time_format, chatMsg.content);
            }),
      ),
    );
  }

  Container buildMessageItem(String groupId, int lastMsgId, String avator, String name,
      String time_format, String lastMessage) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: InkWell(
          onTap: () {
            print("打开群组会话: $name");
            Get.to(() => ChatPage(), arguments: {"groupId": groupId, "lastMsgId": lastMsgId});
          },
          child: Row(children: [
            buildMessageItemAvatar(avator),
            SizedBox(width: 10),
            buildMessageItemContent(name, time_format, lastMessage)
          ])),
    );
  }

  ClipRRect buildMessageItemAvatar(String avator) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/images/icon.png',
        fit: BoxFit.fitWidth,
        image: avator,
        width: 40,
        height: 40,
      ),
    );
  }

  Expanded buildMessageItemContent(
      String name, String time_format, String lastMessage) {
    return Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 4,
      ),
      Row(
        children: [
          Text(name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              )),
          Spacer(),
          Text(time_format, style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Text(lastMessage, style: TextStyle(color: Colors.grey, fontSize: 13)),
      SizedBox(
        height: 8,
      ),
      Divider(height: 1, color: Colors.grey.shade300)
    ]));
  }
}
