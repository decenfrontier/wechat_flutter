import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ws_chat_flutter/pages/home/index.dart';

import 'widgets/mine.dart';
import 'widgets/message.dart';
import 'widgets/friend.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(() => buildBottomNavigationBar()),
        body: Obx((() => buildIndexedStack())));
  }

  IndexedStack buildIndexedStack() {
    return IndexedStack(
      index: controller.tabIndex.value,
      children: [
        MessagePage(),
        FriendPage(),
        Center(
          child: Text("发现页 暂未开发"),
        ),
        MinePage(),
      ],
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: controller.tabIndex.value,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        controller.tabIndex.value = index;
      },
      items: [
        BottomNavigationBarItem(
          label: "消息",
          icon: Image.asset(
            "assets/images/message.png",
            width: 25,
          ),
          activeIcon: Image.asset(
            "assets/images/message.png",
            width: 25,
            color: Colors.green,
          ),
        ),
        BottomNavigationBarItem(
          label: "好友",
          icon: Image.asset(
            "assets/images/contact.png",
            width: 25,
          ),
          activeIcon: Image.asset(
            "assets/images/contact.png",
            width: 25,
            color: Colors.green,
          ),
        ),
        BottomNavigationBarItem(
          label: "发现",
          icon: Image.asset(
            "assets/images/find.png",
            width: 25,
          ),
          activeIcon: Image.asset(
            "assets/images/find.png",
            width: 25,
            color: Colors.green,
          ),
        ),
        BottomNavigationBarItem(
          label: "我的",
          icon: Image.asset(
            "assets/images/mine.png",
            width: 25,
          ),
          activeIcon: Image.asset(
            "assets/images/mine.png",
            width: 25,
            color: Colors.green,
          ),
        )
      ],
    );
  }
}
