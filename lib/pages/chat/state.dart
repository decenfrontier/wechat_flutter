import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/biz/custom_class.dart';
import 'package:ws_chat_flutter/common/entities/index.dart';

class ChatState {
  // 群组id
  var _groupId = "".obs;
  set groupId(value) => _groupId.value = value;
  get groupId => _groupId.value;
  // maxMsgId
  var _maxMsgId = 0.obs;
  set maxMsgId(value) => _maxMsgId.value = value;
  get maxMsgId => _maxMsgId.value;
  // aliasName
  var _aliasName = "".obs;
  set aliasName(value) => _aliasName.value = value;
  get aliasName => _aliasName.value;
  // 群组消息表
  var _groupMsgList = Rx<MsgList?>(MsgList([]));
  set groupMsgList(value) => _groupMsgList.value = value;
  get groupMsgList => _groupMsgList.value;
}
