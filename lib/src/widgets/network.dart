import "package:flutter/material.dart";


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
    this.nothing,
    this.waiting=waitingFunction,
    this.withError,
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
            return const Text('未加载');
          case ConnectionState.waiting:
            return widget.waiting!();
          default:
            if (snapshot.hasError) {
              return const Text('加载失败');
            } else {
              return widget.withData(snapshot.data);
            }
        }
      },
    );
  }
}


Widget waitingFunction(){
  return const Center(
    child: Text('加载中')
  );
}