import "package:flutter_test/flutter_test.dart";
import "package:quanttide_design/testing.dart";

import "package:flutter/material.dart";
import "package:quanttide_design/quanttide_design.dart";

import 'mock.dart';


void main(){
  testWidgets("FutureBuilder组件测试", (WidgetTester tester) async {
    NetworkFutureBuilder widget = NetworkFutureBuilder(
      future: APIClient(
          mock: true,
          mockHandler: mockHandler
      ).requestAPI(
        httpMethod: 'GET',
        apiHost: 'api.example.com',
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
