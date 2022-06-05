import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wechat_flutter/common/apis/message.dart';
import 'package:wechat_flutter/common/biz/custom_class.dart';
import 'package:wechat_flutter/common/entities/index.dart';
import 'package:wechat_flutter/common/utils/utils.dart';
import 'package:wechat_flutter/pages/home/controller.dart';

class ChatController extends GetxController {
  static ChatController get to => Get.find();

  var inputController = TextEditingController(); // 输入内容
  var inputType = 1; // 输入类型

  var groupId = "";
  late ChatMsg lastMsg;
  var aliasName = "";
  var groupMsgList = <ChatMsg>[];

  setValue(
      {inputContent, inputType, groupId, lastMsg, aliasName, groupMsgList}) {
    this.inputController.text = inputContent ?? inputController.text;
    this.inputType = inputType ?? this.inputType;
    this.lastMsg = lastMsg ?? this.lastMsg;
    this.groupId = groupId ?? this.groupId;
    this.aliasName = aliasName ?? this.aliasName;
    this.groupMsgList = groupMsgList ?? this.groupMsgList;
    update();
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    print("chat on init");
    groupId = Get.arguments["groupId"];
    lastMsg = Get.arguments["lastMsg"];
    aliasName = Get.arguments["aliasName"];
    // 有数据则不用拉取离线消息, 直接返回
    if (groupMsgList.isNotEmpty) {
      return;
    }
    // 把最新消息先放入到群组消息列表中
    groupMsgList.add(lastMsg);
    update();
    // 判断当前maxMsgId的值根据maxMsgId从后往前拉取信息
    var maxMsgId = lastMsg.id;
    var data = PullRequest(
        platform: HomeController.to.platform,
        groupId: groupId,
        maxMsgId: maxMsgId);
    MessageAPI.pull(data).then((pullResp) {
      if (pullResp.list.isEmpty) {
        print("没有拉取到消息");
        return;
      }
      int startPos = -1;
      for (var msg in pullResp.list) {
        var nextIdx = groupMsgList.append(msg, startPos);
        startPos = nextIdx;
      }
      update();
      print("获取群组$groupId的消息列表成功");
    }).catchError((err) {
      // 显示弹窗
      Get.snackbar("获取消息页数据失败", "$err");
    });
  }

  void sendMsg() {
    if (inputController.text == "") {
      Get.snackbar("提示", "不能发送空白信息");
    }
    print("send ${inputController.text}");
    var uuid = genUuid();
    var data = UploadRequest(
        groupId: groupId, content: inputController.text, type: 1, uuid: uuid);
    MessageAPI.upload(data).then((uploadResp) {
      print("消息上传成功");
      this.inputController.text = ""; // 清空输入栏
      update();
    }).catchError((err) {
      // 显示弹窗
      Get.snackbar("消息上传失败", "$err");
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
