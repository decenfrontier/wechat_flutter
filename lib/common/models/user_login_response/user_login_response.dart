import 'result.dart';

class UserLoginResponse {
  String? errorCode;
  String? errorMsg;
  Result? result;

  UserLoginResponse({this.errorCode, this.errorMsg, this.result});

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) {
    return UserLoginResponse(
      errorCode: json['errorCode'] as String?,
      errorMsg: json['errorMsg'] as String?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'errorCode': errorCode,
        'errorMsg': errorMsg,
        'result': result?.toJson(),
      };
}
