import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/widgets/password.dart';

import 'index.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Scaffold(
            body: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
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
                    _buildForm(),
                    SizedBox(height: 20),
                    // 注册 与 登录按钮
                    _buildButton(),
                  ],
                ))));
      },
    );
  }

  Form _buildForm() {
    return Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: AutofillGroup(
          child: Column(
          children: [
            TextFormField(
              restorationId: 'email_field',
              autofocus: true,
              autofillHints: [AutofillHints.email],
              // initialValue: "ws156858@163.com",
              textInputAction: TextInputAction.next,
              validator: controller.emailValidator,
              decoration: InputDecoration(
                filled: true,
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.email),
                hintText: "login_email_hint".tr,
                labelText: "login_email".tr,
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) {
                controller.userEmail = value!;
              },
              onEditingComplete: () => TextInput.finishAutofillContext(),
            ),
            SizedBox(height: 25),
            PasswordField(
              labelText: "login_password".tr,
              hintText: "login_password_hint".tr,
              validator: controller.passwordValidator,
              textInputAction: TextInputAction.next,
              onSaved: (value) {
                controller.userPassword = value!;
              },
              
            ),
          ],
        )));
  }

  Row _buildButton() {
    return Row(
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
    );
  }
}
