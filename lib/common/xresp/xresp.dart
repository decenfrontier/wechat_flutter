class ResponseData<T> {
  int code;
  String msg;
  T? data;

  ResponseData({required this.code, required this.msg, T? result});
  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      ResponseData(
        code: json['code'] as int,
        msg: json['msg'] as String,
        result: json['data'] as T?,
      );
}