import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:ws_chat_flutter/common/entities/index.dart';
// import 'package:web_socket_channel/status.dart' as status;
import 'package:ws_chat_flutter/common/apis/user.dart';
import 'package:ws_chat_flutter/common/routes/routes.dart';
import 'package:ws_chat_flutter/common/xresp/xresp.dart';


class MineController extends GetxController {
  static MineController get to => Get.find();

  var loaded = false;
  var userId = 0;
  var nickName = "";
  var email = "";
  var gender = 0;
  var avatarUrl = "";

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    // 发送请求 获取个人信息
    var data = PersonalInfoRequest();
    UserAPI.personalInfo(data: data).then((personalResp) {
      userId = personalResp.userId;
      email = personalResp.email;
      nickName = personalResp.nickName;
      gender = personalResp.gender;
      avatarUrl = personalResp.avatarUrl;
      loaded = true;
      print("获取个人信息成功: $userId $avatarUrl");
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
    print("建立websocket连接");
    final channel = IOWebSocketChannel.connect('ws://101.42.134.18:10002/ws');
    print("websocket connected");
    channel.stream.listen((message) {
      print("received $message");
      // channel.sink.add('received!'); // 收到消息后回复
      // channel.sink.close(status.goingAway);
    });
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
