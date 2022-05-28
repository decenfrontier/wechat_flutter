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

  final int maxMsgId;
  PullRequest({
    required this.platform,
    required this.groupId,
    required this.maxMsgId,
  });
  factory PullRequest.fromJson(Map<String, dynamic> m) {
    return PullRequest(
      platform: m['platform'],
      groupId: m['groupId'],
      maxMsgId: m['maxMsgId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'platform': platform,
      'groupId': groupId,
      'maxMsgId': maxMsgId,
    };
  }
}

class ChatMsg {
  int id;

  final String groupId;

  final int senderId;

  final int type;

  final String content;

  final String uuid;

  final int createTime;
  ChatMsg({
    this.id = 0,
    required this.groupId,
    required this.senderId,
    required this.type,
    required this.content,
    required this.uuid,
    required this.createTime,
  });
  factory ChatMsg.fromJson(Map<String, dynamic> m) {
    return ChatMsg(
      id: m['id'],
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
      'id': id,
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

class GroupInfo {
  final String groupId;
  final String avatarUrl;
  final String aliasName;

  GroupInfo({required this.groupId, required this.avatarUrl, required this.aliasName});

  factory GroupInfo.fromJson(Map<String, dynamic> m) {
    return GroupInfo(
      groupId: m['groupId'],
      avatarUrl: m['avatarUrl'],
      aliasName: m['aliasName'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
      'avatarUrl': avatarUrl,
      'aliasName': aliasName,
    };
  }
}
