/// 微信云托管APIClient
///
/// 用以Flutter客户端访问微信云托管提供的服务。
/// 提供了对冷启动状态下503状态码的处理。

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:http/testing.dart';


/// APIClient
class APIClient {
  /// 是否Mock
  bool mock;
  /// Mock函数
  MockClientHandler? mockClientHandler;
  /// HTTP客户端
  late http.Client client;

  APIClient({
    this.mock=false,
    this.mockClientHandler,
  }){
    if (mock){
      client = MockClient(mockClientHandler!);
    }
    else {
      client = http.Client();
    }
    // TODO: 通过调节RetryClient参数调整冷启动处理策略。
    client = RetryClient(client);
  }

  /// 请求服务端API
  ///
  /// 遵循Python `requests`库的API风格设计。
  Future<dynamic> requestAPI({
    required String httpMethod,
    required String apiRoot,
    required String apiPath,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    // 处理请求
    http.Request request = http.Request(
        httpMethod,
        Uri.https(apiRoot, apiPath, queryParameters)
    );
    // 修改默认Content-Type从text/plain为application/json
    request.headers['Content-Type'] = 'application/json';
    // 转格式
    request.body = json.encode(data);
    // 发送请求和接收响应
    http.StreamedResponse streamedResponse = await client.send(request);
    // TODO: 增加`stream` feature flag，控制返回格式。
    http.Response response = await http.Response.fromStream(streamedResponse);
    // 处理响应
    switch (response.statusCode){
      case 200:
      case 201:
        return parseResponseData(response);
      case 204:
        return null;
      case 503:
        throw Error();
      default:
        throw Error();
    }
  }

  /// 处理返回值
  ///
  /// TODO：增加除了json格式之外的处理。
  dynamic parseResponseData(http.Response response){
    if (response.headers['Content-Type'] == 'application/json'){
      // https://stackoverflow.com/questions/55865173/how-to-decode-json-string-as-utf-8
      return json.decode(utf8.decode(response.bodyBytes));
    }
    else {
      return response.body;
    }
  }
}
