import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/entities/message.dart';
import 'package:ws_chat_flutter/common/mock/data.dart';
import 'package:ws_chat_flutter/common/widgets/app_bar.dart';

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
            itemCount: Data.mockMessageList.length,
            itemBuilder: (context, index) {
              ChatMsg item = Data.mockMessageList[index];
              var senderId = item.senderId;
              var userInfo = Data.senderInfoMap[senderId]!;
            
              return buildMessageItem(userInfo["avatar"]!, userInfo["nickName"]!,
                  item.createTime, item.content);
            }),
      ),
    );
  }

  Container buildMessageItem(
      String avator, String name, int time, String lastMessage) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: FadeInImage.assetNetwork(
              placeholder: 'asstes/images/icon.png',  // https://s1.ax1x.com/2022/05/19/Oq3yDg.jpg
              //预览图
              fit: BoxFit.fitWidth,
              image: avator,
              width: 40,
              height: 40,
            ),
          
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(height: 4,),
          Row(
            children: [
              Text(name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      )),
              Spacer(),
              Text("$time", style: TextStyle(color: Colors.grey, fontSize: 13)),
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
        ]))
      ]),
    );
  }
}
