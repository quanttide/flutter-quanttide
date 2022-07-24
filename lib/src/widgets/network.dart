/// 网络数据加载组件
///
/// 参考资料：
///   - https://blog.csdn.net/u011272795/article/details/83010974

import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";


/// 网络数据加载组件
class NetworkFutureBuilder extends StatefulWidget {
  final Future future;
  final Function withData;
  final Function? nothing;
  final Function? waiting;
  final Function? withError;

  const NetworkFutureBuilder({
    Key? key,
    required this.future,
    required this.withData,
    this.nothing=defaultNothing,
    this.waiting=defaultWaiting,
    this.withError=defaultWithError,
  }) : super(key: key);

  @override
  NetworkFutureBuilderState createState() => NetworkFutureBuilderState();
}

class NetworkFutureBuilderState extends State<NetworkFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return widget.nothing!();
          case ConnectionState.waiting:
            return widget.waiting!();
          default:
            if (snapshot.hasError) {
              return widget.withError!(snapshot.error);
            } else {
              return widget.withData(snapshot.data);
            }
        }
      },
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