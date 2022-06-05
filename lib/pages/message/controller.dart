import 'dart:convert';

import 'package:get/get.dart';
import 'package:wechat_flutter/common/apis/group.dart';
import 'package:wechat_flutter/common/biz/custom_class.dart';
import 'package:wechat_flutter/common/biz/websocket.dart';
import 'package:wechat_flutter/common/entities/index.dart';
import 'package:wechat_flutter/common/store/user.dart';
import 'package:wechat_flutter/pages/chat/index.dart';
import 'package:wechat_flutter/pages/home/controller.dart';

class MessageController extends GetxController {
  static MessageController get to => Get.find();

  var messageGroupInfoMap = <String, GroupInfo>{};
  var messageGroupList = <ChatMsg>[];

  setValue({messageGroupInfoMap, messageGroupList}) {
    this.messageGroupInfoMap = messageGroupInfoMap ?? this.messageGroupInfoMap;
    this.messageGroupList = messageGroupList ?? this.messageGroupList;
    update();
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    print("message on init");
    // 发送请求 获取消息页数据
    var data = MessageGroupInfoListRequest();
    GroupAPI.messageGroupInfoList(data).then((messageGroupInfoListResp) {
      var messageGroupInfoList = messageGroupInfoListResp.list;
      var messageGroupInfoMap = <String, GroupInfo>{};
      var messageGroupList = <ChatMsg>[];
      for (var i = 0; i < messageGroupInfoList.length; i++) {
        var groupMsg = messageGroupInfoList[i];
        var groupId = groupMsg.groupId;
        messageGroupInfoMap[groupId] = GroupInfo(
            groupId: groupId,
            avatarUrl: groupMsg.avatarUrl,
            aliasName: groupMsg.aliasName);
        messageGroupList.add(groupMsg.lastMsg);
      }
      setValue(
          messageGroupInfoMap: messageGroupInfoMap,
          messageGroupList: messageGroupList);
      print("获取消息页数据成功");
    }).catchError((err) {
      // 显示弹窗
      Get.snackbar("获取消息页数据失败", "$err");
    });
    // 建立websocket连接, 设置回调
    var wsConn = WsSocket(
        headers: {
          "Authorization": UserStore.to.token,
          "platform": HomeController.to.platform,
        },
        onListen: (message) {
          print("收到消息：$message");
          var chatMsg = ChatMsg.fromJson(jsonDecode(message));
          // 根据消息的groupId, 发到对应的ChatController的groupMsgList中
          var controller = Get.find<ChatController>(tag: chatMsg.groupId);
          controller.groupMsgList.append(chatMsg);
          controller.update();
        },
        onError: (error) {
          print("收到错误：$error");
        });
    // 开始监听
    wsConn.start();
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
