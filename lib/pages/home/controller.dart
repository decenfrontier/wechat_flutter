import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/utils/platform.dart';

import 'state.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  // 响应式成员变量
  final state = HomeState();
  // 普通成员变量
  final platform = getPlatform();

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
