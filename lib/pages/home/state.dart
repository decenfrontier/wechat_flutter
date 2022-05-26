import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/entities/index.dart';

// 通用状态
class HomeState {
  var _tabIndex = RxInt(0);  // 当前选项卡索引
  set tabIndex(value) => _tabIndex.value = value;
  get tabIndex => _tabIndex.value;
}

// 消息页 状态
class MessageState {
  var _messageGroupInfoMap = Rx<Map<String, dynamic>?>({});
  set messageGroupInfoMap(value) => _messageGroupInfoMap.value = value;
  get messageGroupInfoMap => _messageGroupInfoMap.value;

  var _messageGroupList = Rx<List<ChatMsg>?>([]);
  set messageGroupList(value) => _messageGroupList.value = value;
  get messageGroupList => _messageGroupList.value;
}

// 聊天页 状态
class ChatState {
  // 群组消息表
  var _groupMsgList = Rx<List<ChatMsg>?>([]);
  set groupList(value) => _groupMsgList.value = value;
  get groupList => _groupMsgList.value;
}

// 我的页 状态
class MineState {
  var _userId = 0.obs;
  set userId(value) => _userId.value = value;
  get userId => _userId.value;

  var _nickName = "".obs;
  set nickName(value) => _nickName.value = value;
  get nickName => _nickName.value;

  var _email = "".obs;
  set email(value) => _email.value = value;
  get email => _email.value;

  var _gender = 0.obs;
  set gender(value) => _gender.value = value;
  get gender => _gender.value;
}
