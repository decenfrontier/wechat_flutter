import 'package:get/get.dart';
import 'package:ws_chat_flutter/common/entities/group.dart';

class HomeState {
  // 当前选项卡索引
  var _tabIndex = 2.obs;
  set tabIndex(value) => _tabIndex.value = value;
  get tabIndex => _tabIndex.value;
}

class MessageState {
  // 群组信息表(群组id, 备注, 头像, 最后一条消息)
  var _groupInfoMap = Rx<Map<int, GroupInfoEntity>?>(null);
  set groupInfoMap(value) => _groupInfoMap.value = value;
  get groupInfoMap => _groupInfoMap.value;
}

class ChatState {
  // 群组消息表
  var _groupMsgList = Rx<List<GroupMsgEntity>?>(null);
  set groupList(value) => _groupMsgList.value = value;
  get groupList => _groupMsgList.value;
}

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
