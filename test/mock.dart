/// Mock工具

import 'dart:convert';

import 'package:http/http.dart' as http;


/// Mock函数
///
/// TODO: 声明式配置代替if else。
Future<http.Response> mockHandler(http.Request request) async {
  if (request.method == 'GET' &&
      request.url == Uri.https('api.example.com', '/get')
  ){
    // GET方法，200, 返回值为JSON
    return http.Response(json.encode({'key': 'value'}), 200, headers: {
      'Content-Type': 'application/json',
    });
  }
  else if (request.method == 'POST' &&
      request.url == Uri.https('api.example.com', '/post')
  ){
    // POST方法, 200, 返回值为JSON
    return http.Response(request.body, 200, headers: {
      'Content-Type': 'application/json',
    });
  }
  else if (request.method == 'GET' &&
      request.url == Uri.https('api.example.com', '/return-no-json')
  ){
    // 200，返回值非JSON
    return http.Response("OK", 200);
  }
  else if (request.method == 'GET' &&
      request.url == Uri.https('api.example.com', '/cold-start')
  ){
    // 503
    /// TODO: 模拟冷启动完成
    return http.Response('Clod Starting', 503);
  }
  else if (request.method == 'POST'
      && request.url == Uri.https('api.example.com', '/signup/')){
    // 注册
    return http.Response('OK', 200);
  }
  else if (request.method == 'POST'
      && request.url == Uri.https('api.example.com', '/login/')){
    // 登录
    return http.Response('OK', 200);
  }
  else {
    // 默认为404
    return http.Response('Not Found', 404);
  }
}
