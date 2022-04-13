class Result {
  String? token;

  Result({this.token});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}
