import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller.dart';
import '../discover/index.dart';
import '../friend/index.dart';
import '../message/index.dart';
import '../mine/index.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build home");
    ScreenUtil.init(context);
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      body: buildIndexedStack(),
    );
  }

  Widget buildIndexedStack() {
    return Obx(() => IndexedStack(
          index: controller.state.tabIndex,
          children: [
            MessagePage(),
            FriendPage(),
            DiscoverPage(),
            MinePage(),
          ],
        ));
  }

  Widget buildBottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
          currentIndex: controller.state.tabIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            controller.state.tabIndex = index;
          },
          items: [
            BottomNavigationBarItem(
              label: "消息",
              icon: Image.asset(
                "assets/images/message.png",
                width: 22,
              ),
              activeIcon: Image.asset(
                "assets/images/message.png",
                width: 22,
                color: Colors.green,
              ),
              tooltip: "",
            ),
            BottomNavigationBarItem(
              label: "好友",
              icon: Image.asset(
                "assets/images/contact.png",
                width: 22,
              ),
              activeIcon: Image.asset(
                "assets/images/contact.png",
                width: 22,
                color: Colors.green,
              ),
              tooltip: "",
            ),
            BottomNavigationBarItem(
              label: "发现",
              icon: Image.asset(
                "assets/images/find.png",
                width: 22,
              ),
              activeIcon: Image.asset(
                "assets/images/find.png",
                width: 22,
                color: Colors.green,
              ),
              tooltip: "",
            ),
            BottomNavigationBarItem(
              label: "我的",
              icon: Image.asset(
                "assets/images/mine.png",
                width: 22,
              ),
              activeIcon: Image.asset(
                "assets/images/mine.png",
                width: 22,
                color: Colors.green,
              ),
              tooltip: "",
            )
          ],
        ));
  }
}
