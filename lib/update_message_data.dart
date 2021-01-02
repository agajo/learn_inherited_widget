import 'package:flutter/material.dart';

// InheritedWidgetを作ります。
class MessageData extends InheritedWidget {
  const MessageData({Key key, @required Widget child, @required this.message})
      : assert(child != null),
        super(key: key, child: child);

  // 今回はmessageをコンストラクタで受け取ります。
  final String message;

  @override
  bool updateShouldNotify(MessageData old) {
    return true;
  }
}

class UpdateMessage extends StatelessWidget {
  const UpdateMessage();
  @override
  Widget build(BuildContext context) {
    return MessageData(
        message: 'メッセージその1だよ',
        child: Scaffold(
          appBar: AppBar(),
          // 内容を変えたMessageDataウィジェットを挟み込みます
          body: MessageData(
            message: 'メッセージその2ですよ〜〜〜',
            child: WidgetA(),
          ),
        ));
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA();
  @override
  Widget build(BuildContext context) {
    final message =
        context.dependOnInheritedWidgetOfExactType<MessageData>().message;
    return Text(message);
  }
}
