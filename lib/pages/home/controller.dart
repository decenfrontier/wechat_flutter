import 'package:get/get.dart';


import 'state.dart';

class HomeController extends GetxController {
  HomeController();

  // 响应式成员变量
  final state = HomeState();

  @override
  void onInit() {
    super.onInit();
    print("home on init");
  }

  @override
  void onReady() {
    super.onReady();
    print("on ready");
  }
}
