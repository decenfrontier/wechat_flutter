import 'package:get/get.dart';

class FriendController extends GetxController {
  FriendController();

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
