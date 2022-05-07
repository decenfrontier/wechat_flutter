import './codes.dart';

var mapCodeMsg = {
  Status.OK: "成功",
  Status.CLIENT_ERROR: "客户端自身错误",
  Status.UNAUTHORIZED: "身份认证失败",
  Status.PARAM_ERROR: "缺少必传参数",
  Status.NO_DATA: "没有数据",
  Status.DATA_EXIST: "数据已存在",
  Status.SERVER_ERROR: "服务端开小差啦,请稍后再试一试",
  Status.DB_ERROR: "数据库操作异常",
};

String? codeToMsg(int code) {
  if (!mapCodeMsg.containsKey(code)) {
    return mapCodeMsg[Status.SERVER_ERROR];
  } else {
    return mapCodeMsg[code];
  }
}
