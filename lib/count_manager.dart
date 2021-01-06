import 'package:flutter/material.dart';

// InheritedWidgetはStateを保持するだけの役。
// privateにします。
class _StateContainer extends InheritedWidget {
  const _StateContainer({Key key, @required Widget child, this.data})
      : assert(child != null),
        super(key: key, child: child);

  // CountManagerStateのインスタンスを保持し、下層に流します。
  final CountManagerState data;

  @override
  bool updateShouldNotify(_StateContainer old) {
    return true;
  }
}

// 状態管理用Widgetです。
class CountManager extends StatefulWidget {
  const CountManager({this.child});

  final Widget child;

  // ofメソッドはStatefulWidgetが持ちます。
  // ofにlisten引数を追加します。デフォルトはtrueです。
  static CountManagerState of(BuildContext context, {bool listen = true}) =>
      listen
          ? context.dependOnInheritedWidgetOfExactType<_StateContainer>().data
          // listen==falseの場合、このcontextが更新の対象にならないようにします。
          : (context
                  .getElementForInheritedWidgetOfExactType<_StateContainer>()
                  .widget as _StateContainer)
              .data;
  @override
  CountManagerState createState() => CountManagerState();
}

class CountManagerState extends State<CountManager> {
  // 下層からアクセスしたいプロパティです。
  int count = 0;

  // 下層からアクセスしたい状態更新用メソッドです。
  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _StateContainer(
      // InheritedWidgetのdataに、このStateインスタンス自体を渡す。
      data: this,
      child: widget.child,
    );
  }
}
