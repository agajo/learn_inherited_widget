import 'package:flutter/material.dart';

class MessageData extends InheritedWidget {
  const MessageData({Key key, @required Widget child})
      : assert(child != null),
        super(key: key, child: child);

  final String message = 'InheritedWidgetが保持してるメッセージだよ〜〜〜〜';

  @override
  bool updateShouldNotify(MessageData old) {
    return true;
  }

  // ofを実装します！！！
  static MessageData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MessageData>();
}

class MainWidget extends StatelessWidget {
  const MainWidget();
  @override
  Widget build(BuildContext context) {
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
    // of経由で呼びます！！！
    // final message = context.dependOnInheritedWidgetOfExactType<MessageData>().message;
    final message = MessageData.of(context).message;
    return Text(message);
  }
}
