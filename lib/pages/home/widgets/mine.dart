import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/store/user.dart';

import '../controller.dart';

class MinePage extends GetView<HomeController> {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profile = UserStore.to.profile;
    print(profile.nickName);
    print(profile.email);
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white, statusBarBrightness: Brightness.dark),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color: Colors.white,
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: Image.asset("assets/images/avator.jpg",
                              width: 55),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile.nickName,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(children: [
                              Text(profile.email,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600)),
                              Spacer(),
                              Image.asset("assets/images/qrcode.png",
                                  width: 20),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset("assets/images/next.png", width: 20),
                            ])
                          ],
                        ))
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 20,
                      margin: EdgeInsets.only(left: 65, top: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(13))),
                      child: Row(children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.add,
                          size: 14,
                          color: Colors.grey,
                        ),
                        Text("状态",
                            style: TextStyle(color: Colors.grey, fontSize: 10))
                      ]),
                    )
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            buildItem(() {}, "assets/images/wxpay.png", "支付"),
            SizedBox(
              height: 10,
            ),
            buildItem(() {}, "assets/images/collect.png", "收藏"),
            buildItem(() {}, "assets/images/picture.png", "朋友圈"),
            buildItem(() {}, "assets/images/cardpackage.png", "卡包"),
            buildItem(() {}, "assets/images/emoij.png", "表情"),
            SizedBox(
              height: 10,
            ),
            buildItem(() {}, "assets/images/setting.png", "设置"),
          ],
        )),
      ),
    );
  }

  Ink buildItem(Function press, String image, String text) {
    return Ink(
      child: InkWell(
        onTap: () {},
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Image.asset(
                image,
                width: 20,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(top: 15, right: 15, bottom: 15),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      text,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
                    Image.asset(
                      "assets/images/next.png",
                      width: 18,
                      color: Colors.grey,
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
