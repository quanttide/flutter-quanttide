import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

import "package:flutter_quanttide/testing.dart";
import "package:flutter_quanttide/api_client.dart";
import "package:flutter_quanttide/src/widgets/network.dart";

import 'mock.dart';


void main(){
  testWidgets("FutureBuilder组件测试", (WidgetTester tester) async {
    NetworkFutureBuilder widget = NetworkFutureBuilder(
      future: APIClient(
          mock: true,
          mockHandler: mockHandler,
          apiRoot: 'http://api.example.com/root'
      ).requestAPI(
        httpMethod: 'GET',
        apiPath: '/get',
      ),
      withData: (dynamic data) => const Text('请求成功'),
    );
    // 异步组件测试
    await pumpAsyncWidget(tester, widget);
    // 验证
    final titleFinder = find.text('请求成功');
    expect(titleFinder, findsOneWidget);
  });
}
