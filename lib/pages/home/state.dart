import 'package:get/get.dart';

class HomeState {
  // 当前选项卡索引
  var _tabIndex = 3.obs;
  set tabIndex(value) => _tabIndex.value = value;
  get tabIndex => _tabIndex.value;

  // ---------------------- 我的 ----------------------
  var _nickName = "".obs;
  set nickName(value) => _nickName.value = value;
  get nickName => _nickName.value;
  
  var _email = "".obs;
  set email(value) => _email.value = value;
  get email => _email.value;
}
