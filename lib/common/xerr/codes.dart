class Status {
  static const int OK = 0; // 成功

  static const int CLIENT_ERROR = 4000; // 客户端自身错误
  static const int UNAUTHORIZED = 4001; // 身份认证失败
  static const int PARAM_ERROR = 4002; // 缺少必传参数
  static const int NO_DATA = 4003; // 没有数据
  static const int DATA_EXIST = 4004; // 数据已存在

  static const int SERVER_ERROR = 5000; // 服务端开小差啦,请稍后再试一试
  static const int DB_ERROR = 5001; // 数据库操作异常
}
