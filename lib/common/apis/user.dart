import 'dart:io';

import 'package:ws_chat_flutter/common/models/user.dart';
import 'package:ws_chat_flutter/common/ret/response.dart';
import 'package:ws_chat_flutter/common/utils/http.dart';

// 用户接口
class UserAPI {
  static Future<ResponseData> login({UserLoginRequest? data}) async {
    var respData = await HttpUtil().post(
      '/user/login',
      data: data?.toJson(),
    );
    return ResponseData.fromJson(respData);
  }
}
