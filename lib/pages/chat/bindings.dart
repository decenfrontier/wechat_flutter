import 'package:get/get.dart';

import 'controller.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    print("ChatBinding lazyPut");
    Get.lazyPut(() => ChatController(), fenix: true);
  }
}
