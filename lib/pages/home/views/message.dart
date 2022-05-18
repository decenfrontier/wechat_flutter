import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            itemCount: Data.message.length,
            itemBuilder: (context, index) {
              Map item = Data.message[index];
              return buildMessageItem(item["avator"], item["nickName"],
                  item["time"], item["lastMessage"]);
            }),
      ),
    );
  }

  Container buildMessageItem(
      String avator, String name, String time, String lastMessage) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Image.asset(
            avator,
            width: 50,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              Spacer(),
              Text(time, style: TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(lastMessage, style: TextStyle(color: Colors.grey, fontSize: 14)),
          SizedBox(
            height: 10,
          ),
          Divider(height: 1, color: Colors.grey.shade300)
        ]))
      ]),
    );
  }
}
