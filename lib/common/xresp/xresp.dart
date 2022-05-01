class RespBody {
  int code;
  String msg;
  dynamic data;

  RespBody({required this.code, required this.msg, this.data});
  factory RespBody.fromJson(Map<String, dynamic> json) {
    var respBody = RespBody(
      code: json['code'] as int,
      msg: json['msg'] as String,
      data: json['data'] as Map<String, dynamic>?,
    );
    return respBody;
  }
}
