/// Mock工具

import 'dart:convert';

import 'package:http/http.dart' as http;


/// Mock函数
Future<http.Response> mockClientHandler(http.Request request) async {
  if (request.method == 'GET' &&
      request.url == Uri.https('api.example.com', '/path')
  ){
    // 200 OK
    return http.Response(json.encode({'key': 'value'}), 200);
  }
  else if (request.method == 'GET' &&
      request.url == Uri.https('api.example.com', '/cold_start')
  ){
    // 503
    /// TODO: 模拟冷启动完成
    return http.Response('Clod Starting', 503);
  }
  else {
    // 默认为404
    return http.Response('Not Found', 404);
  }
}
