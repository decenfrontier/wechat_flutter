import 'package:dio/dio.dart';
import 'package:ws_chat_flutter/common/entities/user.dart';
import 'package:ws_chat_flutter/common/store/user.dart';
import 'package:ws_chat_flutter/common/xerr/index.dart';
import 'package:ws_chat_flutter/common/xresp/xresp.dart';
import 'package:ws_chat_flutter/common/utils/http.dart';

// 用户接口
class UserAPI {
  // 注册
  static Future<RegisterResponse> register({RegisterRequest? data}) async {
    var respData = await HttpUtil().post(
      '/api/user/register',
      data: data?.toJson(),
    );
    var respBody = RespBody.fromJson(respData);
    if (respBody.code == Status.OK) {
      return RegisterResponse.fromJson(respBody.data);
    }
    // 其它情况直接抛异常
    throw respBody;
  }

  // 登录
  static Future<LoginResponse> login({LoginRequest? data}) async {
    var respData = await HttpUtil().post(
      '/api/user/login',
      data: data?.toJson(),
    );
    var respBody = RespBody.fromJson(respData);
    if (respBody.code == Status.OK) {
      return LoginResponse.fromJson(respBody.data);
    }
    // 其它情况直接抛异常
    throw respBody;
  }

  // 获取个人信息
  static Future<PersonalInfoResponse> personalInfo(
      {PersonalInfoRequest? data}) async {
    print("token:" + UserStore.to.token);
    var respData = await HttpUtil().post(
      '/api/user/personal_info',
      data: data?.toJson(),
      options: Options(headers: {"Authorization": UserStore.to.token}),
    );
    var respBody = RespBody.fromJson(respData);
    if (respBody.code == Status.OK) {
      return PersonalInfoResponse.fromJson(respBody.data);
    }
    throw respBody;
  }
}
