import 'package:get/get.dart';

import 'controller.dart';

class MineBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineController());
  }
}
