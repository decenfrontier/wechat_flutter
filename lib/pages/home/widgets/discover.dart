import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/mock/data.dart';
import 'package:ws_chat_flutter/common/widgets/app_bar.dart';

import '../controller.dart';

class DiscoverPage extends GetView<HomeController> {
  const DiscoverPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: HeaderBar.BuildAppBar("发 现"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildItem(() {}, "assets/images/wechat_moment.png", "朋友圈"),
            SizedBox(
              height: 10,
            ),
            buildItem(() {}, "assets/images/video.png", "视频号"),
            SizedBox(
              height: 10,
            ),
            buildItem(() {}, "assets/images/scan.png", "扫一扫"),
            buildItem(() {}, "assets/images/shake.png", "摇一摇"),
            SizedBox(
              height: 10,
            ),
            buildItem(() {}, "assets/images/view.png", "看一看"),
            buildItem(() {}, "assets/images/searchs.png", "搜一搜"),
            SizedBox(
              height: 10,
            ),
            buildItem(() {}, "assets/images/miniprogram.png", "小程序"),
          ],
        ),
      ),
    );
  }

  Ink buildItem(Function press, String image, String text) {
    return Ink(
      child: InkWell(
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
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.grey.shade200, width: 1))),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      text,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
                    Image.asset(
                      "assets/images/next.png",
                      width: 20,
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
