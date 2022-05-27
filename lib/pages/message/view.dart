import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/entities/message.dart';
import 'package:ws_chat_flutter/common/utils/timex.dart';
import 'package:ws_chat_flutter/common/widgets/app_bar.dart';
import 'package:ws_chat_flutter/common/widgets/network_img.dart';

import '../chat/view.dart';
import 'controller.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: HeaderBar.BuildAppBar("消 息"),
      body: SizedBox(
        height: size.height,
        child: Obx(() => ListView.builder(
            itemCount: controller.state.messageGroupList.length,
            itemBuilder: (context, index) {
              ChatMsg chatMsg = controller.state.messageGroupList[index];
              var groupId = chatMsg.groupId;
              var groupInfo = controller.state.messageGroupInfoMap[groupId]!;
              var time_format = timeStampToString(chatMsg.createTime);
              return buildMessageItem(
                  groupId,
                  chatMsg.id,
                  groupInfo["avatarUrl"]!,
                  groupInfo["aliasName"]!,
                  time_format,
                  chatMsg.content);
            })),
      ),
    );
  }

  Container buildMessageItem(String groupId, int maxMsgId, String avator,
      String aliasName, String timeFormat, String lastMessage) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: InkWell(
          onTap: () {
            // TODO: 读取离线消息刷新页面
            Get.to(() => ChatPage(),
                arguments: {
                  "groupId": groupId,
                  "maxMsgId": maxMsgId,
                  "aliasName": aliasName
                },
                transition: Transition.rightToLeft);
          },
          child: Row(children: [
            buildMessageItemAvatar(avator),
            SizedBox(width: 10),
            buildMessageItemContent(aliasName, timeFormat, lastMessage)
          ])),
    );
  }

  ClipRRect buildMessageItemAvatar(String avatarUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: FadeInNetworkImg(avatarUrl, width: 40, height: 40),
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
