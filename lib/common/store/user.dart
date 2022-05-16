import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/utils/storage.dart';
import 'package:ws_chat_flutter/common/values/storage.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();
  // token
  String token = '';
  bool get hasToken => token.isNotEmpty;

  
  @override
  void onInit() {
    super.onInit();
    this.token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
  }

  // 保存 token
  Future<void> setToken(String value) async {
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
    this.token = value;
  }

  // 删除 token
  Future<void> rmToken() async {
    await StorageService.to.remove(STORAGE_USER_TOKEN_KEY);
  }

  

}
