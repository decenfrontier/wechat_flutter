class Ret {
  static String statusOk = "1000"; 
}

class ResponseData<T> {
  String errorCode;
  String errorMsg;
  T? result;

  ResponseData({required this.errorCode, required this.errorMsg, T? result});
  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      ResponseData(
        errorCode: json['errorCode'] as String,
        errorMsg: json['errorMsg'] as String,
        result: json['result'] as T?,
      );
}