import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/api_datas/user.dart';
import 'package:ws_chat_flutter/common/apis/user.dart';
import 'package:ws_chat_flutter/common/routes/routes.dart';
import 'package:ws_chat_flutter/common/xresp/xresp.dart';

import 'state.dart';

class HomeController extends GetxController {
  HomeController();

  // 响应式成员变量
  final state = HomeState();

  @override
  void onInit() {
    super.onInit();
    print("home on init");
    // 发送请求 获取个人信息
    var data = PersonalInfoRequest();
    UserAPI.personalInfo(data: data).then((personalResp) {
      // 获取个人信息成功
      state.email = personalResp.email;
      state.nickName = personalResp.nickName;
      print(personalResp.userId);
      print("获取个人信息成功");
    }).catchError((err) {
      var errInfo = "$err";
      if (err.runtimeType is RespBody) {
        errInfo = "${err.code} ${err.msg}";
      }
      // 显示弹窗
      Get.snackbar("personal_err_title".tr, errInfo);
      // 跳转到登录页面
      Get.offAllNamed(AppRouter.Login);
    });
  }

  @override
  void onReady() {
    super.onReady();
    print("on ready");
  }
}
