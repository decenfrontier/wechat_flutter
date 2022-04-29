class Ret {
  static int statusOk = 0; 
}

class ResponseData<T> {
  int code;
  String msg;
  T? data;

  ResponseData({required this.code, required this.msg, this.data});
  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      ResponseData(
        code: json['code'] as int,
        msg: json['msg'] as String,
        data: json['data'] as T?,
      );
}