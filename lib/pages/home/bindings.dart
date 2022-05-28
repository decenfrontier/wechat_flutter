import '../message/controller.dart';
import '../friend/controller.dart';
import '../discover/controller.dart';
import '../mine/controller.dart';
import './controller.dart';
import 'package:get/get.dart';

// 这里 把Home需要用到的所有状态都put进去
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => FriendController());
    Get.lazyPut(() => DiscoverController());
    Get.lazyPut(() => MineController());
    Get.lazyPut(() => HomeController());
  }
}
