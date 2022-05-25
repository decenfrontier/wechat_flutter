import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/apis/user.dart';
import 'package:ws_chat_flutter/common/entities/index.dart';
import 'package:ws_chat_flutter/common/routes/routes.dart';
import 'package:ws_chat_flutter/common/store/user.dart';

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

  // 提交 登录 请求
  void submitLogin() {
    final isValid = formKey.currentState!.validate();
    print("isValid:$isValid");
    Get.focusScope!.unfocus();

    if (isValid) {
      formKey.currentState!.save();
      // 发送 登录请求
      var data = LoginRequest(email: userEmail, password: userPassword);
      UserAPI.login(data: data).then((loginResp) {
        // 写入token到系统中
        UserStore.to.setToken(loginResp.accessToken);
        // 跳转首页
        Get.offAllNamed(AppRouter.Home);
      }).catchError((respBody) {
        // 显示弹窗
        Get.snackbar("login_err_title".tr, "${respBody.code} ${respBody.msg}");
      });
    }
  }

  // 提交注册请求
  void submitRegister() {
    final isValid = formKey.currentState!.validate();
    print("isValid:$isValid");
    Get.focusScope!.unfocus();

    if (isValid) {
      formKey.currentState!.save();
      // 发送注册请求
      var data = RegisterRequest(email: userEmail, password: userPassword);
      UserAPI.register(data: data).then((registerResp) {
        print("注册成功");
        // 显示弹窗
        Get.snackbar("注册成功", "");
      }).catchError((respBody) {
        // 显示弹窗
        Get.snackbar(
            "register_err_title".tr, "${respBody.code} ${respBody.msg}");
      });
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
