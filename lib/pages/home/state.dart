import 'package:get/get.dart';

// 通用状态
class HomeState {
  // 当前选项卡索引
  var _tabIndex = RxInt(0);  
  set tabIndex(value) => _tabIndex.value = value;
  get tabIndex => _tabIndex.value;
}
