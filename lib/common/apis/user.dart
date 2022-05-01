import 'package:ws_chat_flutter/common/api_datas/user.dart';
import 'package:ws_chat_flutter/common/xresp/xresp.dart';
import 'package:ws_chat_flutter/common/utils/http.dart';

// 用户接口
class UserAPI {
  // 注册
  static Future<ResponseData<RegisterResponse>> register(
      {RegisterRequest? data}) async {
    var respData = await HttpUtil().post(
      '/api/user/register',
      data: data?.toJson(),
    );
    return ResponseData.fromJson(respData);
  }

  // 登录
  static Future<ResponseData<LoginResponse>> login({LoginRequest? data}) async {
    var respData = await HttpUtil().post(
      '/api/user/login',
      data: data?.toJson(),
    );
    return ResponseData.fromJson(respData);
  }

  // 获取个人信息
  static Future<ResponseData<LoginResponse>> personalInfo({LoginRequest? data}) async {
    var respData = await HttpUtil().post(
      '/api/user/personal_info',
      data: data?.toJson(),
    );
    return ResponseData.fromJson(respData);
  }
}
