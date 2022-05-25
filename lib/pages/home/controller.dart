import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:ws_chat_flutter/common/apis/group.dart';
import 'package:ws_chat_flutter/common/entities/index.dart';
// import 'package:web_socket_channel/status.dart' as status;
import 'package:ws_chat_flutter/common/apis/user.dart';
import 'package:ws_chat_flutter/common/routes/routes.dart';
import 'package:ws_chat_flutter/common/xresp/xresp.dart';

import 'state.dart';

class HomeController extends GetxController {
  HomeController();

  // 响应式成员变量
  final homeState = HomeState();
  final mineState = MineState();
  final messageState = MessageState();

  @override
  void onInit() {
    super.onInit();
    print("home on init");
    // 发送请求 获取个人信息
    var data = PersonalInfoRequest();
    UserAPI.personalInfo(data: data).then((personalResp) {
      // 我的
      mineState.userId = personalResp.userId;
      mineState.email = personalResp.email;
      mineState.nickName = personalResp.nickName;
      mineState.gender = personalResp.gender;
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
    // 发送请求 获取消息页数据
    var data2 = MessageGroupInfoListRequest();
    GroupAPI.messageGroupInfoList(data: data2).then((messageGroupInfoListResp) {
      var messageGroupInfoList = messageGroupInfoListResp.list;
      var messageGroupInfoMap = <String, dynamic>{};
      var messageGroupList = <ChatMsg>[];
      for (var i = 0; i < messageGroupInfoList.length; i++) {
        var groupMsg = messageGroupInfoList[i];
        var groupId = groupMsg.groupId;
        messageGroupInfoMap[groupId] = {
          "aliasName": groupMsg.aliasName,
          "avatarUrl": groupMsg.avatarUrl,
        };
        messageGroupList.add(groupMsg.lastMsg);
      }
      messageState.messageGroupInfoMap = messageGroupInfoMap;
      messageState.messageGroupList = messageGroupList;
      print("获取消息页数据成功");
    }).catchError((err) {
      // 显示弹窗
      Get.snackbar("获取消息页数据失败", "$err");
    });
  }

  @override
  void onReady() {
    super.onReady();
    print("on ready");
  }
}
