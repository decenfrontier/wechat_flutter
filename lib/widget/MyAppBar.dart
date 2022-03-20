import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBar {
  static AppBar BuildAppBar(String title) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      shadowColor: Colors.grey.shade300,
      backgroundColor: Colors.grey.shade300,
      title: Text(
        "$title",
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
    );
  }
}
