import '../entities/message.dart';

class MsgList {
  List<ChatMsg> _list = [];
  int startPos;
  MsgList(this._list, {this.startPos = -1});

  int add(ChatMsg msg) {
    if (startPos == -1) {
      startPos = _list.length - 1;
    }
    for (var i = startPos; i >= 0; i--) {
      var cur = _list[i];
      // 从后往前遍历 找到第一个创建时间小于msg的createtime的
      if ((cur.createTime == msg.createTime && cur.uuid != msg.uuid) ||
          (cur.createTime < msg.createTime)) {
        _list.insert(i + 1, msg);
        return i;  // 插入成功, 告诉下一个要插入的从哪里开始比较
      }
    }
    return -1;
  }
}
