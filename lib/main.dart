import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:ws_chat_flutter/page/Message.dart';
import 'package:ws_chat_flutter/page/Contact.dart';

void main() {
  runApp(const MyApp());
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, statusBarBrightness: Brightness.dark
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var tabIndex = 0; // 点击的tab下标

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabIndex,
          selectedItemColor: Colors.green,
          // 让label字体变绿
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              tabIndex = index;
            });
          },

          items: [
            BottomNavigationBarItem(
              label: "微信",
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
              label: "联系人",
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
        ),
        body: IndexedStack(
          index: tabIndex,
          children: [
            message(),
            Contact(),
            Center(
              child: Text("3"),
            ),
            Center(
              child: Text("4"),
            ),
          ],
        ));
  }
}
