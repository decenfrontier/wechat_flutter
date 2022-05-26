import '../message/controller.dart';
import '../mine/controller.dart';
import './controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => MineController());
    Get.lazyPut(() => HomeController());
  }
}
