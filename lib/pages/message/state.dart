import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/entities/message.dart';

class MessageState {
  var _messageGroupInfoMap = Rx<Map<String, dynamic>?>({});
  set messageGroupInfoMap(value) => _messageGroupInfoMap.value = value;
  get messageGroupInfoMap => _messageGroupInfoMap.value;

  var _messageGroupList = Rx<List<ChatMsg>?>([]);
  set messageGroupList(value) => _messageGroupList.value = value;
  get messageGroupList => _messageGroupList.value;
}
