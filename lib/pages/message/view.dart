import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat_flutter/common/entities/message.dart';
import 'package:wechat_flutter/common/utils/timex.dart';
import 'package:wechat_flutter/common/widgets/app_bar.dart';
import 'package:wechat_flutter/common/widgets/network_img.dart';

import '../chat/view.dart';
import 'controller.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar("消 息"),
      body: SizedBox(
        child: GetBuilder<MessageController>(
            builder: (controller) => ListView.builder(
                itemCount: controller.messageGroupList.length,
                itemBuilder: (context, index) {
                  ChatMsg chatMsg = controller.messageGroupList[index];
                  var groupId = chatMsg.groupId;
                  var groupInfo = controller.messageGroupInfoMap[groupId]!;
                  var time_format = timeStampToString(chatMsg.createTime);
                  return buildMessageItem(groupId, chatMsg, groupInfo.avatarUrl,
                      groupInfo.aliasName, time_format);
                })),
      ),
    );
  }

  Container buildMessageItem(String groupId, ChatMsg lastMsg, String avator,
      String aliasName, String timeFormat) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: InkWell(
          onTap: () {
            Get.to(() => ChatPage(tag: groupId),
                arguments: {
                  "groupId": groupId,
                  "lastMsg": lastMsg,
                  "aliasName": aliasName
                },
                transition: Transition.rightToLeft);
          },
          child: Row(children: [
            buildMessageItemAvatar(avator),
            SizedBox(width: 10),
            buildMessageItemContent(aliasName, timeFormat, lastMsg.content)
          ])),
    );
  }

  ClipRRect buildMessageItemAvatar(String avatarUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: CacheImg(avatarUrl, width: 40, height: 40),
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
