// --./group--

import 'message.dart';

class AddFriendRequest {
  final int userId;
  AddFriendRequest({
    required this.userId,
  });
  factory AddFriendRequest.fromJson(Map<String, dynamic> m) {
    return AddFriendRequest(
      userId: m['user_id'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
    };
  }
}

class AddFriendResponse {
  AddFriendResponse();
  factory AddFriendResponse.fromJson(Map<String, dynamic> m) {
    return AddFriendResponse();
  }
  Map<String, dynamic> toJson() {
    return {};
  }
}

class HandleFriendRequest {
  final String groupId;

  final bool isAgree;
  HandleFriendRequest({
    required this.groupId,
    required this.isAgree,
  });
  factory HandleFriendRequest.fromJson(Map<String, dynamic> m) {
    return HandleFriendRequest(
      groupId: m['groupId'],
      isAgree: m['isAgree'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
      'isAgree': isAgree,
    };
  }
}

class HandleFriendResponse {
  final String groupId;
  HandleFriendResponse({
    required this.groupId,
  });
  factory HandleFriendResponse.fromJson(Map<String, dynamic> m) {
    return HandleFriendResponse(
      groupId: m['groupId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
    };
  }
}

class GroupUserListRequest {
  final String groupId;
  GroupUserListRequest({
    required this.groupId,
  });
  factory GroupUserListRequest.fromJson(Map<String, dynamic> m) {
    return GroupUserListRequest(
      groupId: m['groupId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
    };
  }
}

class GroupUserListResponse {
  final List<int> list;
  GroupUserListResponse({
    required this.list,
  });
  factory GroupUserListResponse.fromJson(Map<String, dynamic> m) {
    return GroupUserListResponse(
      list: m['list'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'list': list,
    };
  }
}

class MessageGroupInfoListRequest {
  MessageGroupInfoListRequest();
  factory MessageGroupInfoListRequest.fromJson(Map<String, dynamic> m) {
    return MessageGroupInfoListRequest();
  }
  Map<String, dynamic> toJson() {
    return {};
  }
}


class MessageGroupInfo {
  final String groupId;

  final String aliasName;

  final String avatarUrl;

  final ChatMsg lastMsg;
  MessageGroupInfo({
    required this.groupId,
    required this.aliasName,
    required this.avatarUrl,
    required this.lastMsg,
  });
  factory MessageGroupInfo.fromJson(Map<String, dynamic> m) {
    return MessageGroupInfo(
      groupId: m['groupId'],
      aliasName: m['aliasName'],
      avatarUrl: m['avatarUrl'],
      lastMsg: ChatMsg.fromJson(m['lastMsg']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
      'aliasName': aliasName,
      'avatarUrl': avatarUrl,
      'lastMsg': lastMsg.toJson(),
    };
  }
}

class MessageGroupInfoListResponse {
  final List<MessageGroupInfo> list;
  MessageGroupInfoListResponse({
    required this.list,
  });
  factory MessageGroupInfoListResponse.fromJson(Map<String, dynamic> m) {
    return MessageGroupInfoListResponse(
      list: (m['list'] as List<dynamic>)
          .map((i) => MessageGroupInfo.fromJson(i))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'list': list.map((i) => i.toJson()),
    };
  }
}
