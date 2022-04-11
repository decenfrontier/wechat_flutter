import 'package:ws_chat_flutter/common/models/user.dart';
import 'package:ws_chat_flutter/common/utils/http.dart';

// 登录, 注册, 忘记密码
class LoginAPI {
  static Future<User> login({User? param}) async {
    var response = await HttpUtil().get(
      '/news',
      queryParameters: param?.toJson(),
    );
    return User.fromJson(response);
  }
}
