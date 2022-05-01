import 'dart:io';

import 'package:ws_chat_flutter/common/models/user.dart';
import 'package:ws_chat_flutter/common/xresp/xresp.dart';
import 'package:ws_chat_flutter/common/utils/http.dart';

// 用户接口
class UserAPI {
  static Future<ResponseData<UserLoginResponse>> login({UserLoginRequest? data}) async {
    var respData = await HttpUtil().post(
      '/api/user/login',
      data: data?.toJson(),
    );
    return ResponseData.fromJson(respData);
  }
}
