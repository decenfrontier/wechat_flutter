import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeaderBar {
  static AppBar BuildAppBar(String title) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 36,
      shadowColor: Colors.grey.shade300,
      backgroundColor: Colors.grey.shade300,
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      actions: [
        Image.asset(
          "assets/images/search.png",
          width: 22,
        ),
        SizedBox(
          width: 10,
        ),
        Image.asset(
          "assets/images/more.png",
          width: 22,
        ),
        SizedBox(
          width: 10,
        ),
      ],
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.grey.shade300,
      ),
    );
  }
}
