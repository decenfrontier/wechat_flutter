import '../chat/controller.dart';
import '../message/controller.dart';
import '../mine/controller.dart';
import './controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineController());
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => HomeController());
  }
}
