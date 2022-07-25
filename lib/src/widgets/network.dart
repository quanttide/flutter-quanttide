/// 网络数据加载组件
///
/// 参考资料：
///   - https://blog.csdn.net/u011272795/article/details/83010974
///
/// TODO:
///   - 统一维护FutureBuilder和StreamBuilder组件的builder函数。mixin或者函数传参都比较麻烦。

import 'dart:ui';

import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";


typedef NothingCallback = Widget Function();
typedef WaitingCallback = Widget Function();
typedef WithDataCallback = Widget Function(dynamic data);
typedef WithErrorCallback = Widget Function(dynamic error);
// defaultBuilder函数通不过此类型验证，原因未排查出来。
typedef NetworkBuilder = Widget Function(
    BuildContext context,
    AsyncSnapshot<dynamic> snapshot,
    NothingCallback nothing,
    WaitingCallback waiting,
    WithErrorCallback withError,
    WithDataCallback withData
);


/// 抽象类
abstract class NetworkStatefulWidget extends StatefulWidget {
  final WithDataCallback withData;
  final NothingCallback? nothing;
  final WaitingCallback? waiting;
  final WithErrorCallback? withError;
  final Function? builder;

  const NetworkStatefulWidget({
    Key? key,
    required this.withData,
    this.nothing = defaultNothing,
    this.waiting = defaultWaiting,
    this.withError = defaultWithError,
    this.builder = defaultBuilder,
  }) : super(key: key);
}


/// 网络数据加载FutureBuilder组件
class NetworkFutureBuilder extends NetworkStatefulWidget {
  final Future future;

  const NetworkFutureBuilder({
    Key? key,
    required this.future,
    required withData,
    nothing=defaultNothing,
    waiting=defaultWaiting,
    withError=defaultWithError,
    builder=defaultBuilder,
  }) : super(
    key: key,
    nothing: nothing,
    waiting: waiting,
    withError: withError,
    withData: withData,
    builder: builder,
  );

  @override
  NetworkFutureBuilderState createState() => NetworkFutureBuilderState();
}

class NetworkFutureBuilderState extends State<NetworkFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          return widget.builder!(
            context: context,
            snapshot: snapshot,
            nothing: widget.nothing!,
            waiting: widget.waiting!,
            withError: widget.withError!,
            withData: widget.withData,
          );
        }
    );
  }
}


/// 网络数据加载StreamBuilder组件
class NetworkStreamBuilder extends NetworkStatefulWidget {
  final Stream stream;

  const NetworkStreamBuilder({
    Key? key,
    required this.stream,
    required withData,
    nothing=defaultNothing,
    waiting=defaultWaiting,
    withError=defaultWithError,
    builder=defaultBuilder,
  }) : super(
    key: key,
    nothing: nothing,
    waiting: waiting,
    withError: withError,
    withData: withData,
    builder: builder
  );

  @override
  NetworkStreamBuilderState createState() => NetworkStreamBuilderState();
}

class NetworkStreamBuilderState extends State<NetworkStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          return widget.builder!(
            context: context,
            snapshot: snapshot,
            nothing: widget.nothing!,
            waiting: widget.waiting!,
            withError: widget.withError!,
            withData: widget.withData,
          );
      }
    );
  }
}


/// 默认builder
Widget defaultBuilder({
  required BuildContext context,
  required AsyncSnapshot<dynamic> snapshot,
  NothingCallback nothing=defaultNothing,
  WaitingCallback waiting=defaultWaiting,
  WithErrorCallback withError=defaultWithError,
  required WithDataCallback withData,
}) {
  switch (snapshot.connectionState) {
    case ConnectionState.none:
      return nothing();
    case ConnectionState.waiting:
      return waiting();
    default:
      Widget doneWidget;
      if (snapshot.hasError) {
        doneWidget = withError(snapshot.error);
      } else {
        doneWidget = withData(snapshot.data);
      }
      // TODO: 区分可刷新（比如503）和不可刷新异常，不可刷新异常禁止刷新。
      return RefreshIndicator(
          onRefresh: () async {
            // TODO: 真实请求
            Future.delayed(const Duration(seconds: 1));
          },
          // bugfix: https://github.com/flutter/flutter/issues/85023
          // TODO: 依然不可用
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              }
            ),
            child: doneWidget
          )
      );
  }
}

/// 默认"未加载"
Widget defaultNothing() {
  return const Center(
    child: Text('未加载')
  );
}

/// 默认"加载中"
Widget defaultWaiting() {
  return const Center(
      child: CircularProgressIndicator()
  );
}

/// 默认"加载错误"
Widget defaultWithError(dynamic error) {
  // `kDebugMode` is better by [`kReleaseMode`'s doc](https://api.flutter.dev/flutter/foundation/kReleaseMode-constant.html)
  // > Generally it is better to use kDebugMode or assert to gate code,
  // > since using kReleaseMode will introduce differences between release and profile builds,
  // > which makes performance testing less representative.
  if (kDebugMode) {
    return Center(
      child: ErrorWidget(error)
    );
  }
  else {
    return const Center(
      child: Text('加载失败')
    );
  }
}
