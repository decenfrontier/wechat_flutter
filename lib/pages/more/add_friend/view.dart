import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wechat_flutter/common/widgets/search_bar.dart';

import 'controller.dart';

class AddFriendPage extends StatelessWidget {
  AddFriendPage({Key? key}) : super(key: key);
  final controller = Get.put(AddFriendController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("添加朋友"),
          elevation: 0,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.dark),
        ),
        body: Column(children: [
          SearchBar(
              text: "邮箱",
              onTap: () {
                // controller.search();
                print("点击邮箱号");
              }),
        ]));
  }
}
