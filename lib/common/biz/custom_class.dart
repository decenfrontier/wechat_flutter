import '../entities/message.dart';

extension MsgList on List<ChatMsg> {
  // 扩展List的方法
  int append(ChatMsg msg, [int startPos = -1]) {
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
        return i;
      }
      // 从后往前遍历 找到第一个创建时间小于msg的createtime的
      if (cur.createTime < msg.createTime) {
        this.insert(i + 1, msg);
        return i;
      }
      // 如果是最后一个，直接插入
      if (i == 0) {
        this.insert(0, msg);
        return 0;
      }
    }
    return -1;
  }
}
