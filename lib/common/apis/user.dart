import 'package:dio/dio.dart';
import 'package:wechat_flutter/common/entities/index.dart';
import 'package:wechat_flutter/common/store/user.dart';
import 'package:wechat_flutter/common/xerr/index.dart';
import 'package:wechat_flutter/common/xresp/xresp.dart';
import 'package:wechat_flutter/common/utils/http.dart';

// 用户接口
class UserAPI {
  static final _httpClient = HttpClient("http://101.42.134.18:10001");
  // 注册
  static Future<RegisterResponse> register({RegisterRequest? data}) async {
    var respData = await _httpClient.post(
      '/api/user/register',
      data: data?.toJson(),
    );
    var respBody = RespBody.fromJson(respData);
    if (respBody.code == Status.OK) {
      return RegisterResponse.fromJson(respBody.data);
    }
    throw respBody;
  }

  // 登录
  static Future<LoginResponse> login({LoginRequest? data}) async {
    var respData = await _httpClient.post(
      '/api/user/login',
      data: data?.toJson(),
    );
    var respBody = RespBody.fromJson(respData);
    if (respBody.code == Status.OK) {
      return LoginResponse.fromJson(respBody.data);
    }
    throw respBody;
  }

  // 获取个人信息
  static Future<PersonalInfoResponse> personalInfo(
      {PersonalInfoRequest? data}) async {
    var respData = await _httpClient.post(
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
