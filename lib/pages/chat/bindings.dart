import 'package:get/get.dart';

import '../mine/controller.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    print("ChatBinding lazyPut");
    // ChatController不能用懒加载, 而应该根据收到的参数作为tag来put
    Get.lazyPut(() => MineController());
  }
}
