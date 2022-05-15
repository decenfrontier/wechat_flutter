import './controller.dart';
import 'package:get/get.dart';

class MineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineController());
  }
}
