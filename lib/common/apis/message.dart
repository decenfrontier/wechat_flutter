import 'package:dio/dio.dart';
import 'package:ws_chat_flutter/common/entities/index.dart';
import 'package:ws_chat_flutter/common/store/user.dart';
import 'package:ws_chat_flutter/common/xerr/index.dart';
import 'package:ws_chat_flutter/common/xresp/xresp.dart';
import 'package:ws_chat_flutter/common/utils/http.dart';

// 用户接口
class MessageAPI {
  static final _httpClient = HttpClient("http://101.42.134.18:10002");
  // 上传
  static Future<UploadResponse> upload(UploadRequest? data) async {
    var respData = await _httpClient.post(
      '/api/message/upload',
      data: data?.toJson(),
      options: Options(headers: {"Authorization": UserStore.to.token}),
    );
    var respBody = RespBody.fromJson(respData);
    if (respBody.code == Status.OK) {
      return UploadResponse.fromJson(respBody.data);
    }
    throw respBody;
  }

  // 拉取
  static Future<PullResponse> pull(PullRequest? data) async {
    var respData = await _httpClient.post(
      '/api/message/pull',
      data: data?.toJson(),
      options: Options(headers: {"Authorization": UserStore.to.token}),
    );
    var respBody = RespBody.fromJson(respData);
    if (respBody.code == Status.OK) {
      return PullResponse.fromJson(respBody.data);
    }
    throw respBody;
  }
}
