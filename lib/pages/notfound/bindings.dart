import 'package:get/get.dart';

import 'controller.dart';

class NotFoundBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotFoundController>(() => NotFoundController());
  }
}
