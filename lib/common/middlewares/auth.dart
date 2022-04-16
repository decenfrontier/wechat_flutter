import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/routes/routes.dart';
import 'package:ws_chat_flutter/common/store/user.dart';

// 需要登录
class LoginRequired extends GetMiddleware {
  int? priority = 0;

  LoginRequired([this.priority]);

  @override
  RouteSettings? redirect(String? route) {
    // 如果获取到了token, 则
    if (UserStore.to.token != "") {
      return null;
    }
    Future.delayed(
        Duration(seconds: 1), () => Get.snackbar("提示", "登录过期,请重新登录"));
    return RouteSettings(name: AppRouter.Login);
  }
}
