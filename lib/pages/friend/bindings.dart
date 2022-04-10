import './controller.dart';
import 'package:get/get.dart';

class FriendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FriendController());
  }
}
