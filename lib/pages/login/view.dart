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
            body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("login_title".tr, style: TextStyle(fontSize: 25)),
                      ],
                    ),
                    SizedBox(height: 30),
                    _buildLoginForm()
                  ],
                )));
      },
    );
  }

  Form _buildLoginForm() {
    return Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              initialValue: "ws156858@163.com",
              decoration: InputDecoration(
                labelText: "login_email".tr,
                hintText: "login_email_hint".tr,
                icon: Icon(Icons.email),
              ),
              validator: controller.emailValidator,
              onSaved: (value) {
                controller.userEmail = value!;
              },
            ),
            TextFormField(
              initialValue: "123456",
              decoration: InputDecoration(
                labelText: "login_password".tr,
                hintText: "login_password_hint".tr,
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              validator: controller.passwordValidator,
              onSaved: (value) {
                controller.userPassword = value!;
              },
            ),
            SizedBox(
              height: 20,
            ),
            // 注册 与 登录按钮
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("login_button_register".tr),
                  ),
                  onPressed: () {
                    controller.submitRegister();
                  },
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("login_button_login".tr),
                  ),
                  onPressed: () {
                    controller.submitLogin();
                  },
                )
              ],
            )
          ],
        ));
  }
}
