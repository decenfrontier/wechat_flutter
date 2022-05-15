import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/api_datas/user.dart';
import 'package:ws_chat_flutter/common/utils/storage.dart';
import 'package:ws_chat_flutter/common/values/storage.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();
  // token
  String token = '';
  // 是否登录
  final _isLogin = false.obs;
  // 用户个人信息
  final _profile = PersonalInfoResponse(
    userId: 0,
    nickName: 'xxx',
    gender: 0,
    email: 'xxx@yyy.com',
    groupList: [],
  ).obs;

  bool get isLogin => _isLogin.value;
  PersonalInfoResponse get profile => _profile.value;
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

  // 设置 个人信息
  void setProfile(PersonalInfoResponse personalInfo) {
    this._profile.value = personalInfo;
  }

}
