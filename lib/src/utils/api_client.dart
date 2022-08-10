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
  /// TODO: 增加POST传参
  Future<dynamic> requestAPI({
    required String httpMethod,
    required String apiRoot,
    required String apiPath,
    Map<String, dynamic>? queryParameters
  }) async {
    // https://api.dart.dev/stable/2.16.1/dart-core/Uri/Uri.https.html
    Uri url = Uri.https(apiRoot, apiPath, queryParameters);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      // TODO: 暂时只允许服务端返回json格式。
      'Accept': 'application/json',
    };
    http.Response response;
    // https://pub.dev/documentation/http/latest/http/http-library.html
    switch (httpMethod){
      // Safe HTTP Method, without `body`
      case 'head':
      case 'HEAD':
        response = await client.head(url, headers: headers);
        break;
      case 'get':
      case 'GET':
        response = await client.get(url, headers: headers);
        break;
      case 'post':
      case 'POST':
        response = await client.post(url, headers: headers);
        break;
      case 'put':
      case 'PUT':
        response = await client.put(url, headers: headers);
        break;
      case 'patch':
      case 'PATCH':
        response = await client.patch(url, headers: headers);
        break;
      case 'delete':
      case 'DELETE':
        response = await client.delete(url, headers: headers);
        break;
      default:
        // TODO: 抛出异常
        return null;
    }
    // 处理响应
    if (response.statusCode == 200){
      return parseResponseData(response);
    }
    else if (response.statusCode == 503){
      // 增加临时异常的相关处理逻辑
      throw Error();
    }
    else {
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
