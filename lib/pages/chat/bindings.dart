import 'package:get/get.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    // 这个controller不能用懒加载, 而应该根据收到的参数作为tag来put
  }
}
