import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/routes/routes.dart';
import 'package:ws_chat_flutter/common/store/user.dart';

// 需要登录
class LoginRequired extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  LoginRequired({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin || route == AppRouter.Login) {
      return null;
    }
    Future.delayed(
        Duration(seconds: 1), () => Get.snackbar("提示", "登录过期,请重新登录"));
    return RouteSettings(name: AppRouter.Login);
  }
}
