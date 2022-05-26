import 'package:get/get.dart';

import 'controller.dart';

class FriendBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FriendController());
  }
}
