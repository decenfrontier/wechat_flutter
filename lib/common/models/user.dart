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

class UserLoginResponse {}
