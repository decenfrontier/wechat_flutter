import 'package:dio/dio.dart';
import 'package:wechat_flutter/common/entities/index.dart';
import 'package:wechat_flutter/common/store/user.dart';
import 'package:wechat_flutter/common/xerr/index.dart';
import 'package:wechat_flutter/common/xresp/xresp.dart';
import 'package:wechat_flutter/common/utils/http.dart';

// 群组接口
class GroupAPI {
  static final _httpClient = HttpClient("http://101.42.134.18:10003");
  // 添加好友
  static Future<AddFriendResponse> register({AddFriendRequest? data}) async {
    var respData = await _httpClient.post(
      '/api/group/add_friend',
      data: data?.toJson(),
      options: Options(headers: {"Authorization": UserStore.to.token}),
    );
    var respBody = RespBody.fromJson(respData);
    if (respBody.code == Status.OK) {
      return AddFriendResponse.fromJson(respBody.data);
    }
    throw respBody;
  }

  // 处理好友请求
  static Future<HandleFriendResponse> handleFriend(
      {HandleFriendRequest? data}) async {
    var respData = await _httpClient.post(
      '/api/group/handle_friend',
      data: data?.toJson(),
      options: Options(headers: {"Authorization": UserStore.to.token}),
    );
    var respBody = RespBody.fromJson(respData);
    if (respBody.code == Status.OK) {
      return HandleFriendResponse.fromJson(respBody.data);
    }
    throw respBody;
  }

  // 获取组内所有用户id
  static Future<GroupUserListResponse> groupUserList(
      {GroupUserListRequest? data}) async {
    var respData = await _httpClient.post(
      '/api/group/group_user_list',
      data: data?.toJson(),
      options: Options(headers: {"Authorization": UserStore.to.token}),
    );
    var respBody = RespBody.fromJson(respData);
    if (respBody.code == Status.OK) {
      return GroupUserListResponse.fromJson(respBody.data);
    }
    throw respBody;
  }

  // 消息页 群组信息列表
  static Future<MessageGroupInfoListResponse> messageGroupInfoList(
      MessageGroupInfoListRequest? data) async {
    var respData = await _httpClient.post(
      '/api/group/message_group_info_list',
      data: data?.toJson(),
      options: Options(headers: {"Authorization": UserStore.to.token}),
    );
    var respBody = RespBody.fromJson(respData);
    if (respBody.code == Status.OK) {
      return MessageGroupInfoListResponse.fromJson(respBody.data);
    }
    throw respBody;
  }
}
