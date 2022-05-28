import '../entities/message.dart';

extension MsgList on List<ChatMsg> {
  // 扩展List的方法
  append(ChatMsg msg, [int startPos = -1]) {
    if (startPos == -1) {
      startPos = this.length - 1; // 从哪里开始遍历
    }
    for (var i = startPos; i >= 0; i--) {
      var cur = this[i];
      // 自动去重
      if (cur.createTime == msg.createTime) {
        if (cur.uuid != msg.uuid) {  
          this.insert(i + 1, msg);
        }
        return;
      }
      // 从后往前遍历 找到第一个创建时间小于msg的createtime的
      if (cur.createTime < msg.createTime) {
        this.insert(i + 1, msg);
        return;
      }
    }
  }
}
