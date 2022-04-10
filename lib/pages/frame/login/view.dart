import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Scaffold(
            appBar: AppBar(title: const Text("login")),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text("账号密码登录", style: TextStyle(fontSize: 25)),
                SizedBox(height: 50.0),
              ],
            ));
      },
    );
  }

}
