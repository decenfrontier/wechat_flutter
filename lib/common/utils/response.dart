class Ret {
  static String statusOk = "1000"; 
}

class ResponseData<T> {
  String code;
  String msg;
  T? data;

  ResponseData({required this.code, required this.msg, this.data});
  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      ResponseData(
        code: json['code'] as String,
        msg: json['msg'] as String,
        data: json['data'] as T?,
      );
}