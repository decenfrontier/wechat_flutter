class RegisterRequest {
  final String email;
  final String password;
  String? nickName;
  int? gender;
  RegisterRequest({
    required this.email,
    required this.password,
    this.nickName,
    this.gender,
  });
  factory RegisterRequest.fromJson(Map<String, dynamic> m) {
    return RegisterRequest(
      email: m['email'],
      password: m['password'],
      nickName: m['nickName'],
      gender: m['gender'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'nickName': nickName,
      'gender': gender,
    };
  }
}

class RegisterResponse {
  RegisterResponse();
  factory RegisterResponse.fromJson(Map<String, dynamic> m) {
    return RegisterResponse();
  }
  Map<String, dynamic> toJson() {
    return {};
  }
}

class LoginRequest {
  final String email;
  final String password;
  LoginRequest({
    required this.email,
    required this.password,
  });
  factory LoginRequest.fromJson(Map<String, dynamic> m) {
    return LoginRequest(
      email: m['email'],
      password: m['password'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class LoginResponse {
  final String accessToken;
  final int accessExpire;
  LoginResponse({
    required this.accessToken,
    required this.accessExpire,
  });
  factory LoginResponse.fromJson(Map<String, dynamic> m) {
    return LoginResponse(
      accessToken: m['accessToken'],
      accessExpire: m['accessExpire'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'accessExpire': accessExpire,
    };
  }
}

class PersonalInfoRequest {
  PersonalInfoRequest();
  factory PersonalInfoRequest.fromJson(Map<String, dynamic> m) {
    return PersonalInfoRequest();
  }
  Map<String, dynamic> toJson() {
    return {};
  }
}

class PersonalInfoResponse {
  final int userId;
  final String nickName;
  final int gender;
  final String email;
  final List<String>? groupList;
  PersonalInfoResponse({
    required this.userId,
    required this.nickName,
    required this.gender,
    required this.email,
    this.groupList,
  });
  factory PersonalInfoResponse.fromJson(Map<String, dynamic> m) {
    return PersonalInfoResponse(
      userId: m['userId'],
      nickName: m['nickName'],
      gender: m['gender'],
      email: m['email'],
      groupList: List<String>.from(m['groupList']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'nickName': nickName,
      'gender': gender,
      'email': email,
      'groupList': groupList,
    };
  }
}
