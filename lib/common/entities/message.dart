// --./message--

class UploadRequest {
  final int groupId;

  final int senderId;

  final int type;

  final String content;

  final String uuid;
  UploadRequest({
    required this.groupId,
    required this.senderId,
    required this.type,
    required this.content,
    required this.uuid,
  });
  factory UploadRequest.fromJson(Map<String, dynamic> m) {
    return UploadRequest(
      groupId: m['groupId'],
      senderId: m['senderId'],
      type: m['type'],
      content: m['content'],
      uuid: m['uuid'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
      'senderId': senderId,
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
  final String email;

  final String platform;

  final int groupId;
  PullRequest({
    required this.email,
    required this.platform,
    required this.groupId,
  });
  factory PullRequest.fromJson(Map<String, dynamic> m) {
    return PullRequest(
      email: m['email'],
      platform: m['platform'],
      groupId: m['groupId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'platform': platform,
      'groupId': groupId,
    };
  }
}

class ChatMsg {
  final int groupId;

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
