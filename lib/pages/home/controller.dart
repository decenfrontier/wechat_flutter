import 'package:get/get.dart';
import 'package:wechat_flutter/common/utils/platform.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final platform = getPlatform();
  var tabIndex = 0;

  setValue({tabIndex}) {
    this.tabIndex = tabIndex ?? this.tabIndex;
    update();
  }

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
