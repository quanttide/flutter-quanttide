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
  MockClientHandler? mockHandler;
  /// HTTP客户端
  late http.Client client;

  APIClient({
    this.mock=false,
    this.mockHandler,
  }){
    if (mock){
      // Mock
      client = MockClient(mockHandler!);
    }
    else {
      // 真实
      client = http.Client();
    }
    // 处理503重试
    // TODO: 通过调节RetryClient参数调整冷启动处理策略。
    client = RetryClient(client);
  }

  /// 请求服务端API
  ///
  /// 遵循Python `requests`库的API风格设计。
  ///   - 默认`Content-Type`从`text/plain`修改为`application/json`，
  ///     以适应前后端API常见的传参习惯。
  ///
  /// TODO:
  ///   - 增加特性开关`stream`参数，控制返回格式为`Response`或`StreamedResponse`，
  ///     以方便`FutureBuilder`或者`StreamBuilder`使用。
  ///   - 响应码为201、204等正常情况、30X等重定向情况待验证，暂不确定是否会有异常。
  Future<dynamic> requestAPI({
    required String httpMethod,
    required String apiHost,
    required String apiPath,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    // 处理请求
    http.Request request = http.Request(
        httpMethod,
        Uri.https(apiHost, apiPath, queryParameters)
    );
    request.headers['Content-Type'] = 'application/json';
    request.body = json.encode(data);  // 转格式为String
    // 发送请求和接收响应
    http.StreamedResponse streamedResponse = await client.send(request);
    http.Response response = await http.Response.fromStream(streamedResponse);
    // 处理响应
    if (response.statusCode<400){
      // 正常
      return parseResponseData(response);
    }
    else {
      // 异常
      handleHttpException(response);
    }
  }

  /// （暂时为非公开API）处理返回值
  ///
  /// 尝试以JSON格式解析，异常则抛出。
  ///
  /// TODO：
  ///   - 根据`Content-Type`对应解析数据，并覆盖对应测试。
  ///   - 允许用户继承并覆盖处理逻辑。
  dynamic parseResponseData(http.Response response){
    try {
      // https://stackoverflow.com/questions/55865173/how-to-decode-json-string-as-utf-8
      return json.decode(utf8.decode(response.bodyBytes));
    } catch(e) {
      return response.body;
    }
  }
  
  /// （暂时为非公开API）处理异常情况
  ///
  /// TODO：
  ///   - 规划异常响应规范并对应实现Dart/Flutter异常处理
  ///   - 允许用户继承并覆盖处理逻辑。
  dynamic handleHttpException(http.Response response){
    switch (response.statusCode) {
      case 503:
        // 已知问题：后台冷启动时返回
        throw ServiceUnavailableException('服务端冷启动中', response.request?.url);
      default:
        throw http.ClientException('HTTP请求异常', response.request?.url);
    }
  }

  /// 账号密码注册API
  dynamic signup(String apiHost){
    return requestAPI(
      httpMethod: 'POST',
      apiHost: apiHost,
      apiPath: '/signup/',
    );
  }

  /// 账号密码登录API
  dynamic login(String apiHost){
    return requestAPI(
      httpMethod: 'POST',
      apiHost: apiHost,
      apiPath: '/login/',
    );
  }
}


/// 503 Service Unavailable
class ServiceUnavailableException extends http.ClientException {
  ServiceUnavailableException(
      String message,
      [Uri? uri]
  ) : super(message, uri);
}
