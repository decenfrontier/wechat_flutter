import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/entities/index.dart';

class ChatState {
  // 群组消息表
  var _groupMsgList = Rx<List<ChatMsg>?>([]);
  set groupList(value) => _groupMsgList.value = value;
  get groupList => _groupMsgList.value;
}
