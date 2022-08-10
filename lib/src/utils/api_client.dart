/// 微信云托管APIClient
///
/// 用以Flutter客户端访问微信云托管提供的服务。
/// 提供了对冷启动状态下503状态码的处理。

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:http/testing.dart';


/// 微信云托管APIClient
class WXCloudRunAPIClient {
  /// 是否Mock
  bool mock;
  /// Mock函数
  MockClientHandler? mockClientHandler;
  /// HTTP客户端
  late http.Client client;

  WXCloudRunAPIClient({
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

  /// 请求服务API、
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
    // https://pub.dev/documentation/http/latest/http/get.html
    // 目前服务端API都是GET方法
    // TODO: switch实现httpMethod。
    Function httpMethodFunc = _parseHttpMethod(httpMethod)!;
    http.Response response = await httpMethodFunc(
        url,
        headers: {
          // TODO: 暂时只允许json格式。
          'content-type': 'application/json',
        }
    );
    if (response.statusCode == 200){
      return parseResponse(response);
    }
    else{
      throw Error();
    }
  }

  // 处理HTTP方法
  Function? _parseHttpMethod(String httpMethod){
    switch (httpMethod){
      case 'get':
      case 'GET':
        return client.get;
      case 'post':
      case 'POST':
        return client.post;
      case 'put':
      case 'PUT':
        return client.put;
      case 'patch':
      case 'PATCH':
        return client.patch;
      case 'delete':
      case 'DELETE':
        return client.delete;
      case 'head':
      case 'HEAD':
        return client.head;
      default:
      // TODO: 抛出异常
        return null;
    }
  }

  /// 处理返回值
  ///
  /// TODO：增加除了json格式之外的处理。
  dynamic parseResponse(http.Response response){
    // https://stackoverflow.com/questions/55865173/how-to-decode-json-string-as-utf-8
    return json.decode(utf8.decode(response.bodyBytes));
  }
}
