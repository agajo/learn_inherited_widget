import 'dart:async';

import 'package:flutter/material.dart';

class CountData extends InheritedWidget {
  const CountData({Key key, @required Widget child, @required this.count})
      : assert(child != null),
        super(key: key, child: child);

  final int count;

  @override
  bool updateShouldNotify(CountData old) {
    // 先程の例と違うのはここだけ！！！！！！！！
    // このインスタンスのcountを2で割った商と、置き換え前の古いインスタンスの
    // countを2で割った商が異なる時だけ更新します。
    return count ~/ 2 != old.count ~/ 2;
  }
}

class MainWidget extends StatefulWidget {
  MainWidget();
  final Widget child = Scaffold(
    appBar: AppBar(),
    body: WidgetA(),
  );

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int timeCount = 0;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timeCount++;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CountData(
      count: timeCount,
      child: widget.child,
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA();
  @override
  Widget build(BuildContext context) {
    final count = context.dependOnInheritedWidgetOfExactType<CountData>().count;
    return Text('count: $count');
  }
}
