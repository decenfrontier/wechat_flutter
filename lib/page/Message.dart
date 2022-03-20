import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ws_chat_flutter/data/data.dart';

class message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.grey.shade300,
        backgroundColor: Colors.grey.shade300,
        title: Text(
          "微信",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Image.asset(
            "assets/images/search.png",
            width: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset(
            "assets/images/more.png",
            width: 25,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.grey.shade300,
        ),
      ),
      body: Container(
        height: size.height,
        child: ListView.builder(
            itemCount: Data.message.length,
            itemBuilder: (context, index) {
              Map item = Data.message[index];
              return MessageItem(item["avator"],item["nickName"],item["time"],item["lastMessage"]);
            }),
      ),
    );
  }
}

Container MessageItem(String avator, String name, String time, String lastMessage) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: Row(children: [
      ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Image.asset("$avator", width: 50,),
      ),
      SizedBox(width: 10,),
      Expanded(child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("$name", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                Spacer(),
                Text("$time", style: TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
            SizedBox(height: 5,),
            Text("$lastMessage", style: TextStyle(color: Colors.grey, fontSize: 14)),
            SizedBox(height: 10,),
            Divider(height: 1, color: Colors.grey.shade300)
          ]
      ))
    ]),
  );
}