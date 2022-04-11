import 'package:get/get.dart';
import 'package:ws_chat_flutter/pages/login/bindings.dart';
import 'package:ws_chat_flutter/pages/login/view.dart';
import 'package:ws_chat_flutter/pages/home/index.dart';
import 'package:ws_chat_flutter/pages/notfound/index.dart';

class AppRouter {
  static const Login = '/login'; // 登录页
  static const ChangePwd = '/change_password'; // 修改密码页
  static const Home = '/home'; // 首页
  static const NotFound = '/notfound'; // 未知页

  static const initial = Login;

  static final routes = [
    GetPage(name: Login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: Home, page: () => HomePage(), binding: HomeBinding()),
  ];

  static final unknownRoute =
      GetPage(name: NotFound, page: () => NotFoundView());
}
