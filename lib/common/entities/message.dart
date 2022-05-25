// --./message--

class UploadRequest {
  final String groupId;

  final int type;

  final String content;

  final String uuid;
  UploadRequest({
    required this.groupId,
    required this.type,
    required this.content,
    required this.uuid,
  });
  factory UploadRequest.fromJson(Map<String, dynamic> m) {
    return UploadRequest(
      groupId: m['groupId'],
      type: m['type'],
      content: m['content'],
      uuid: m['uuid'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
      'type': type,
      'content': content,
      'uuid': uuid,
    };
  }
}

class UploadResponse {
  final String uuid;

  final int createTime;
  UploadResponse({
    required this.uuid,
    required this.createTime,
  });
  factory UploadResponse.fromJson(Map<String, dynamic> m) {
    return UploadResponse(
      uuid: m['uuid'],
      createTime: m['createTime'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'createTime': createTime,
    };
  }
}

class PullRequest {
  final String platform;

  final String groupId;

  final int chatMsgId;
  PullRequest({
    required this.platform,
    required this.groupId,
    required this.chatMsgId,
  });
  factory PullRequest.fromJson(Map<String, dynamic> m) {
    return PullRequest(
      platform: m['platform'],
      groupId: m['groupId'],
      chatMsgId: m['chatMsgId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'platform': platform,
      'groupId': groupId,
      'chatMsgId': chatMsgId,
    };
  }
}

class ChatMsg {
  final String groupId;

  final int senderId;

  final int type;

  final String content;

  final String uuid;

  final int createTime;
  ChatMsg({
    required this.groupId,
    required this.senderId,
    required this.type,
    required this.content,
    required this.uuid,
    required this.createTime,
  });
  factory ChatMsg.fromJson(Map<String, dynamic> m) {
    return ChatMsg(
      groupId: m['groupId'],
      senderId: m['senderId'],
      type: m['type'],
      content: m['content'],
      uuid: m['uuid'],
      createTime: m['createTime'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
      'senderId': senderId,
      'type': type,
      'content': content,
      'uuid': uuid,
      'createTime': createTime,
    };
  }
}

class PullResponse {
  final List<ChatMsg> list;
  PullResponse({
    required this.list,
  });
  factory PullResponse.fromJson(Map<String, dynamic> m) {
    return PullResponse(
      list:
          (m['list'] as List<dynamic>).map((i) => ChatMsg.fromJson(i)).toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'list': list.map((i) => i.toJson()),
    };
  }
}
