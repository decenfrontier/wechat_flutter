import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/status.dart' as status;
import 'package:ws_chat_flutter/common/entities/user.dart';
import 'package:ws_chat_flutter/common/apis/user.dart';
import 'package:ws_chat_flutter/common/routes/routes.dart';
import 'package:ws_chat_flutter/common/xresp/xresp.dart';

import 'state.dart';

class HomeController extends GetxController {
  HomeController();

  // 响应式成员变量
  final homeState = HomeState();
  final mineState = MineState();

  @override
  void onInit() {
    super.onInit();
    print("home on init");
    // 发送请求 获取个人信息
    var data = PersonalInfoRequest();
    UserAPI.personalInfo(data: data).then((personalResp) {
      // 获取个人信息成功
      mineState.email = personalResp.email;
      mineState.nickName = personalResp.nickName;
      mineState.userId = personalResp.userId;
      print(personalResp.userId);
      print("获取个人信息成功");
    }).catchError((err) {
      var errInfo = "$err";
      if (err.runtimeType == RespBody) {
        errInfo = "${err.code} ${err.msg}";
      }
      // 显示弹窗
      Get.snackbar("personal_err_title".tr, errInfo);
      // 跳转到登录页面
      Get.offAllNamed(AppRouter.Login);
    });
    // 建立websocket连接
    final channel = IOWebSocketChannel.connect('ws://101.42.134.18:10002/ws');
    print("websocket connected");
    channel.stream.listen((message) {
      print("received $message");
      // channel.sink.add('received!'); // 收到消息后回复
      // channel.sink.close(status.goingAway);
    });
    // 拉取离线消息
  }

  @override
  void onReady() {
    super.onReady();
    print("on ready");
  }
}
