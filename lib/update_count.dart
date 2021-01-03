import 'dart:async';

import 'package:flutter/material.dart';

// InheritedWidgetはmessageではなくcountを保持することにします。
class CountData extends InheritedWidget {
  const CountData({Key key, @required Widget child, @required this.count})
      : assert(child != null),
        super(key: key, child: child);

  final int count;

  @override
  bool updateShouldNotify(CountData old) {
    return true;
  }
}

// StatefulWidgetを使います。
class MainWidget extends StatefulWidget {
  MainWidget();
  // InheritedWidgetのchildには、毎回このインスタンスを渡します。
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
    // Stateの初期化時に、毎秒setStateを呼ぶタイマーを起動します。
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timeCount++;
      });
    });
  }

  @override
  void dispose() {
    // initStateでタイマーを起動・disposeでタイマーを破棄。この2つはセットです。
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // タイマーにより毎秒setStateが呼ばれるので、このbuildメソッドが毎秒呼ばれます。
    // その際、このCountDataコンストラクタでCountDataのインスタンスが毎回作り直されます。
    // 渡す引数が異なるので、作られるCountDataのプロパティは毎回異なります。
    return CountData(
      count: timeCount,
      // StateではなくStatefulWidgetが保持しているchildを渡します。
      // つまり、毎秒変更されるインスタンスはCountDataだけであり、他は変化しません。
      child: widget.child,
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA();
  @override
  Widget build(BuildContext context) {
    // ここでこのWidgetAのBuildContextがCountDataの変更通知対象として登録されるので、
    // CountDataのインスタンスが置き換わるたびにこのbuildメソッドが呼ばれます。
    final count = context.dependOnInheritedWidgetOfExactType<CountData>().count;
    return Text('count: $count');
  }
}
