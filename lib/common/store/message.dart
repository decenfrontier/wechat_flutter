import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/entities/message.dart';

// 用户聊天记录存储到本地
class MessageStore extends GetxController {
  static MessageStore get to => Get.find();

  // 群组消息表, 不需要显示在界面上, 不用设置成响应式变量
  var _historyGroupMsgListMap = <String, List<ChatMsg>?>{};
  set historyGroupMsgListMap(value) => _historyGroupMsgListMap = value;
  get historyGroupMsgListMap => _historyGroupMsgListMap;

  @override
  void onInit() {
    super.onInit();
    
  }

  // 保存 历史聊天消息
  Future<void> saveGroupHistoryMsgList(String value) async {
    // TODO: sqlite
  }

  // 读取 历史聊天消息
  Future<void> readGroupHistoryMsgList() async {
    
  }
}
