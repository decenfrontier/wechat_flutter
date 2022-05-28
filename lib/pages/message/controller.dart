import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/apis/group.dart';
import 'package:ws_chat_flutter/common/entities/index.dart';

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
