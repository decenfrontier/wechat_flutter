import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/api_datas/user.dart';
import 'package:ws_chat_flutter/common/apis/user.dart';
import 'package:ws_chat_flutter/common/routes/routes.dart';
import 'package:ws_chat_flutter/common/store/user.dart';

class HomeController extends GetxController {
  HomeController();

  // 当前选项卡索引
  var tabIndex = 3.obs;

  @override
  void onInit() {
    super.onInit();
    print("home on init");
    
  }

  @override
  void onReady() {
    super.onReady();
    print("on ready");
    // 发送请求 获取个人信息
    var data = PersonalInfoRequest();
    UserAPI.personalInfo(data: data).then((personalResp) {
      // 获取个人信息成功
      UserStore.to.setProfile(personalResp);
      print("获取个人信息成功");
    }).catchError((err) {
      print("运行异常: ${err.runtimeType}");
      // 显示弹窗
      Get.snackbar("personal_err_title".tr, "${err.code} ${err.msg}");
      // 跳转到登录页面
      Get.offAllNamed(AppRouter.Login);
    });
  }
}
