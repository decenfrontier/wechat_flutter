import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/apis/message.dart';
import 'package:ws_chat_flutter/common/entities/index.dart';
import 'package:ws_chat_flutter/pages/home/controller.dart';

import 'index.dart';

class ChatController extends GetxController {
  static ChatController get to => Get.find();

  final state = ChatState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    print("chat on init");
    if (Get.arguments == null) {
      return;
    }
    var args = Get.arguments as Map<String, dynamic>; // 获取参数
    state.groupId = args["groupId"];
    state.maxMsgId = args["maxMsgId"];
    state.aliasName = args["aliasName"];
    print(
        "groupId: ${state.groupId}, maxMsgId: ${state.maxMsgId}, aliasName: ${state.aliasName}");
    // 根据maxMsgId从后往前拉取信息
    var data = PullRequest(
        platform: HomeController.to.platform,
        groupId: state.groupId,
        maxMsgId: state.maxMsgId);
    MessageAPI.pull(data).then((pullResp) {
      var groupMsgList = pullResp.list;
      if (groupMsgList.isEmpty) {
        print("没有拉取到消息");
        return;
      }
      int startPos = -1;
      for (var msg in groupMsgList) {
        var nextIdx = state.groupMsgList.add(msg, startPos);
        startPos = nextIdx;
      }
      print("获取群组${state.groupId}的消息列表成功");
    }).catchError((err) {
      // 显示弹窗
      Get.snackbar("获取消息页数据失败", "$err");
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
