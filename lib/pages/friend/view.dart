import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/mock/data.dart';
import 'package:ws_chat_flutter/common/widgets/app_bar.dart';
import 'package:ws_chat_flutter/pages/friend/controller.dart';

class FriendPage extends GetView<FriendController> {
  FriendPage({Key? key}) : super(key: key);

  String labels = "↑ABCDEFGHIJKLMNOPQRSTUVWSYZ#";

  @override
  Widget build(BuildContext context) {
    // 获取app窗口大小
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: HeaderBar.BuildAppBar("好友"),
        body: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: ListView.builder(
                  itemCount: Data.contact.keys.length,
                  itemBuilder: (context, index) {
                    String key = Data.contact.keys.toList()[index];
                    List pItem = Data.contact[key];
                    return key == "first"
                        ? buildContactSysButton()
                        : buildContactors(context, index, pItem);
                  }),
            ),
            buildContactRightBar(),
          ],
        ));
  }

  Container buildContactRightBar() {
    return Container(
      color: Colors.transparent,
      height: labels.length * 20.0,
      width: 20,
      child: ListView.builder(
          itemCount: labels.length,
          itemBuilder: (context, index) {
            return Ink(
              child: InkWell(
                highlightColor: Colors.green,
                splashColor: Colors.green,
                hoverColor: Colors.green,
                focusColor: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                onTap: () {
                  print(labels[index]);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: 20,
                  child: Text(
                    labels[index],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }),
    );
  }

  // 联系人列表
  Container buildContactors(
      BuildContext context, int index, List<dynamic> pItem) {
    return Container(
      child: Column(
        children: [
          // 上面的字母
          Container(
            padding: EdgeInsets.only(left: 17),
            alignment: Alignment.centerLeft,
            height: 40,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade300,
            child: Text(
              Data.contact.keys.toList()[index],
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          // 属于这个字母的所有联系人
          Container(
            height: pItem.length * 60.0,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: pItem.length,
                itemBuilder: (context, index) {
                  Map item = pItem[index];
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Image.asset(
                            item["avator"],
                            width: 50,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            width: 0.5,
                            color: Colors.grey.shade300,
                          ))),
                          child: Text(
                            item["nickName"],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ))
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  // 联系人系统按钮
  Container buildContactSysButton() {
    return Container(
      height: 4 * 60.0,
      child: Column(
        children: [
          buildMenuItem("assets/images/addnew.png", "新的朋友", Colors.orange),
          buildMenuItem("assets/images/group.png", "群聊", Colors.green),
          buildMenuItem("assets/images/label.png", "标签", Colors.blue),
          buildMenuItem("assets/images/public.png", "公众号", Colors.blue),
        ],
      ),
    );
  }

  // 联系人列表项
  Container buildMenuItem(String avator, String text, Color bgColor) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          children: [
            Container(
              width: 50,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(
                "$avator",
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                height: 50,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 0.5, color: Colors.grey.shade300))),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
