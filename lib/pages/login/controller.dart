import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/apis/user.dart';
import 'package:ws_chat_flutter/common/models/user.dart';
import 'package:ws_chat_flutter/common/ret/codes.dart';
import 'package:ws_chat_flutter/common/routes/routes.dart';

class LoginController extends GetxController {
  LoginController();

  final formKey = GlobalKey<FormState>();
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
      UserAPI.login(
              data: UserLoginRequest(email: userEmail, password: userPassword))
          .then((response) {
        if (response.errorCode != Ret.statusOk) {
          Get.snackbar("login_fail".tr, "login_fail_detail".tr);
          return;
        }
        Get.snackbar("login_success".tr, "login_success_detail".tr);
        Get.offAllNamed(AppRouter.Home);
      }).catchError((e) {
        print(e);
      });
    }
  }

  void submitRegister() {
    final isValid = formKey.currentState!.validate();
    print("isValid:$isValid");
    Get.focusScope!.unfocus();

    if (isValid) {
      formKey.currentState!.save();
      print(userEmail);
      print(userPassword);
      // User those values to send our auth request

    }
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}