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
      groupId: m['group_id'],
      isAgree: m['is_agree'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'group_id': groupId,
      'is_agree': isAgree,
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
      groupId: m['group_id'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'group_id': groupId,
    };
  }
}

class GroupUsersRequest {
  final String groupId;
  GroupUsersRequest({
    required this.groupId,
  });
  factory GroupUsersRequest.fromJson(Map<String, dynamic> m) {
    return GroupUsersRequest(
      groupId: m['group_id'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'group_id': groupId,
    };
  }
}

class GroupUsersResponse {
  final List<int> list;
  GroupUsersResponse({
    required this.list,
  });
  factory GroupUsersResponse.fromJson(Map<String, dynamic> m) {
    return GroupUsersResponse(
      list: m['list'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'list': list,
    };
  }
}
