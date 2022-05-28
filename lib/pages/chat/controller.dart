import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/apis/message.dart';
import 'package:ws_chat_flutter/common/biz/custom_class.dart';
import 'package:ws_chat_flutter/common/entities/index.dart';
import 'package:ws_chat_flutter/pages/home/controller.dart';


class ChatController extends GetxController {
  static ChatController get to => Get.find();

  var groupId = "";
  var maxMsgId = 0;
  var aliasName = "";
  var groupMsgList = <ChatMsg>[];

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    print("chat on init");
    if (Get.arguments == null) {
      return;
    }
    var args = Get.arguments as Map<String, dynamic>; // 获取参数
    groupId = args["groupId"];
    maxMsgId = args["maxMsgId"];
    aliasName = args["aliasName"];
    print("groupId: $groupId, maxMsgId: $maxMsgId, aliasName: $aliasName");
    // 根据maxMsgId从后往前拉取信息
    var data = PullRequest(
        platform: HomeController.to.platform,
        groupId: groupId,
        maxMsgId: maxMsgId);
    MessageAPI.pull(data).then((pullResp) {
      var groupMsgList = pullResp.list;
      if (groupMsgList.isEmpty) {
        print("没有拉取到消息");
        return;
      }
      int startPos = -1;
      for (var msg in groupMsgList) {
        var nextIdx = groupMsgList.append(msg, startPos);
        startPos = nextIdx;
      }
      print("获取群组$groupId的消息列表成功");
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
