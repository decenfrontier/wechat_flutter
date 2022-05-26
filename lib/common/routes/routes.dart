import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/middlewares/auth.dart';
import 'package:ws_chat_flutter/pages/home/views/chat.dart';
import 'package:ws_chat_flutter/pages/home/views/discover.dart';
import 'package:ws_chat_flutter/pages/home/views/friend.dart';
import 'package:ws_chat_flutter/pages/home/views/message.dart';
import 'package:ws_chat_flutter/pages/home/views/mine.dart';
import 'package:ws_chat_flutter/pages/frame/login/bindings.dart';
import 'package:ws_chat_flutter/pages/frame/login/view.dart';
import 'package:ws_chat_flutter/pages/home/index.dart';
import 'package:ws_chat_flutter/pages/frame/notfound/index.dart';

class AppRouter {
  // frame
  static const Login = '/login'; // 登录页
  static const NotFound = '/notfound'; // 未知页
  // home
  static const Home = '/home'; // 首页
  static const Message = '/message'; // 消息
  static const Friend = '/friend'; // 好友
  static const Discover = '/discover'; // 发现
  static const Mine = '/mine'; // 我的
  static const Chat = '/chat'; // 聊天
  // 初始路由
  static const INITIAL = Home;
  // 未知路由
  static final unknownRoute =
      GetPage(name: NotFound, page: () => NotFoundView());
  // 路由
  static final routes = [
    GetPage(
      name: Login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Home,
      page: () => HomePage(),
      binding: HomeBinding(),
      middlewares: [LoginRequired()],
      children: [
        GetPage(name: Message, page: () => MessagePage()),
        GetPage(name: Friend, page: () => FriendPage()),
        GetPage(name: Discover, page: () => DiscoverPage()),
        GetPage(name: Mine, page: () => MinePage()),
        GetPage(name: Chat, page: () => ChatPage()),
      ],
    ),
  ];

  
}
