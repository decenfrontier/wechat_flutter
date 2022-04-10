import 'package:get/get.dart';
import 'package:ws_chat_flutter/pages/home/index.dart';
import 'package:ws_chat_flutter/pages/notfound/index.dart';


class AppRouter {
  static const Home = '/home';
  static const NotFound = '/notfound';

  static const initial = Home;

  static final routes = [
    GetPage(
      name: Home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];

  static final unknownRoute =
      GetPage(name: NotFound, page: () => NotFoundView());
}
