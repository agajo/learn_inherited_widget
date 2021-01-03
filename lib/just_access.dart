import 'package:flutter/material.dart';

// InheritedWidgetを作ります。
class MessageData extends InheritedWidget {
  const MessageData({Key key, @required Widget child})
      : assert(child != null),
        super(key: key, child: child);

  // InheritedWidgetのプロパティは変更不可能なので必ずfinal
  final String message = 'InheritedWidgetが保持してるメッセージだよ〜〜〜〜';

  // updateShouldNotifyについては後で説明します。
  @override
  bool updateShouldNotify(MessageData old) {
    return true;
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget();
  @override
  Widget build(BuildContext context) {
    // Widgetツリーの上層部に、作ったInheritedWidgetを配置
    return MessageData(
        child: Scaffold(
      appBar: AppBar(),
      body: WidgetA(),
    ));
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA();
  @override
  Widget build(BuildContext context) {
    // InheritedWidgetからO(1)でmessageを取得！！
    final message =
        context.dependOnInheritedWidgetOfExactType<MessageData>().message;
    return Text(message);
  }
}
