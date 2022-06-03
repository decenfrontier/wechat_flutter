import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wechat_flutter/common/mock/data.dart';
import 'package:wechat_flutter/common/widgets/app_bar.dart';

class FriendPage extends StatelessWidget {
  const FriendPage({Key? key}) : super(key: key);

  final String labels = "↑ABCDEFGHIJKLMNOPQRSTUVWSYZ#";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BuildAppBar("好 友"),
        body: Stack(
          alignment: Alignment.centerRight,
          children: [
            ListView.builder(
                itemCount: Data.contact.keys.length,
                itemBuilder: (context, index) {
                  String key = Data.contact.keys.toList()[index];
                  List pItem = Data.contact[key];
                  return key == "first"
                      ? buildContactSysButton()
                      : buildContactors(context, index, pItem);
                }),
            buildContactRightBar(),
          ],
        ));
  }

  Container buildContactRightBar() {
    final width = ScreenUtil().setWidth(18);
    final height = ScreenUtil().setHeight(18);
    return Container(
      color: Colors.transparent,
      height: labels.length * height,
      width: width,
      child: ListView.builder(
          itemCount: labels.length,
          itemBuilder: (context, index) {
            return Ink(
              child: InkWell(
                highlightColor: Colors.green,
                splashColor: Colors.green,
                hoverColor: Colors.green,
                focusColor: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(9)),
                onTap: () {
                  print(labels[index]);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: height,
                  width: width,
                  child: Text(
                    labels[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey, fontSize: ScreenUtil().setSp(9)),
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
            height: 30,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade300,
            child: Text(
              Data.contact.keys.toList()[index],
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          // 属于这个字母的所有联系人
          Container(
            height: pItem.length * 50.0,
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
                            width: 40,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          height: 40,
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
                              fontSize: 13,
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
      height: 4 * 50.0,
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
              width: 40,
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
                height: 40,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 0.5, color: Colors.grey.shade300))),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
