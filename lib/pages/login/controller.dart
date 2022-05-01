import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/apis/user.dart';
import 'package:ws_chat_flutter/common/models/user.dart';
import 'package:ws_chat_flutter/common/routes/routes.dart';
import 'package:ws_chat_flutter/common/store/user.dart';
import 'package:ws_chat_flutter/common/xerr/index.dart';


class LoginController extends GetxController {
  LoginController();

  final formKey = GlobalKey<FormState>(); // 校验结果
  String userEmail = '';
  String userPassword = '';

  String? emailValidator(String? value) {
    if (value!.isEmpty || !value.contains('@')) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty || value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
    return null;
  }

  void submitLogin() {
    final isValid = formKey.currentState!.validate();
    print("isValid:$isValid");
    Get.focusScope!.unfocus();

    if (isValid) {
      formKey.currentState!.save();
      // 发送 登录请求
      var data = UserLoginRequest(email: userEmail, password: userPassword);
      UserAPI.login(data: data).then((response) {
        if (response.code != Status.OK) {
          Get.snackbar("login_fail".tr, response.msg);
          return;
        }
        Get.snackbar("login_success".tr, response.msg);
        // 写入token到系统中
        UserStore.to.setToken(response.data!.token);
        // 跳转首页
        Get.offAllNamed(AppRouter.Home);
      }).catchError((e) {
        Get.snackbar("login_err".tr, "$e");
      });
    }
  }

  void submitRegister() {
    final isValid = formKey.currentState!.validate();
    print("isValid:$isValid");
    Get.focusScope!.unfocus();

    if (isValid) {
      formKey.currentState!.save();
      // 发送注册请求
      print(userEmail);
      print(userPassword);
      // User those values to send our auth request

    }
  }

  // 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  // 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  // 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  // dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
