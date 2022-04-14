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

class UserLoginResult {
  String? token;

  UserLoginResult({this.token});

  factory UserLoginResult.fromJson(Map<String, dynamic> json) => UserLoginResult(
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}

class UserLoginResponse {
  String? errorCode;
  String? errorMsg;
  UserLoginResult? result;

  UserLoginResponse({this.errorCode, this.errorMsg, this.result});

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) {
    return UserLoginResponse(
      errorCode: json['errorCode'] as String?,
      errorMsg: json['errorMsg'] as String?,
      result: json['result'] == null
          ? null
          : UserLoginResult.fromJson(json['result'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'errorCode': errorCode,
        'errorMsg': errorMsg,
        'result': result?.toJson(),
      };
}
