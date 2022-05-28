import '../chat/controller.dart';
import '../message/controller.dart';
import '../mine/controller.dart';
import './controller.dart';
import 'package:get/get.dart';

// 这里 把Home需要用到的所有状态都put进去
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineController());
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => HomeController());
  }
}
