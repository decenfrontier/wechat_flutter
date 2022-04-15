// 登录请求
class UserLoginRequest {
  String email;
  String password;

  UserLoginRequest({required this.email, required this.password});

  factory UserLoginRequest.fromJson(Map<String, dynamic> json) =>
      UserLoginRequest(email: json['email'], password: json['password']);

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

// 登录响应
class UserLoginResponse {
  String token;

  UserLoginResponse({required this.token});

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) =>
      UserLoginResponse(
        token: json['token'] as String,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}