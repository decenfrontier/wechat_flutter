import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  var tabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print("on init");
  }

  @override
  void onReady() {
    super.onReady();
    print("on ready");
  }
}
