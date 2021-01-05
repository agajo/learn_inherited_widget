import 'package:flutter/material.dart';

import 'just_access.dart' as just_access;
import 'override_message.dart' as override_message;
import 'update_count.dart' as update_count;
import 'reduce_update.dart' as reduce_update;
import 'implement_of.dart' as implement_of;
import 'update_method.dart' as update_method;

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          PageButton(text: '単に値を取得する例', destination: just_access.MainWidget()),
          PageButton(
              text: 'MessageDataを上書きする例',
              destination: override_message.MainWidget()),
          PageButton(text: '毎秒更新する例', destination: update_count.MainWidget()),
          PageButton(
              text: '更新を間引きする例', destination: reduce_update.MainWidget()),
          PageButton(text: 'ofを実装する例', destination: implement_of.MainWidget()),
          PageButton(
              text: '状態更新メソッドの例', destination: update_method.MainWidget()),
        ],
      ),
    ),
  ));
}

class PageButton extends StatelessWidget {
  const PageButton({
    @required this.destination,
    @required this.text,
    Key key,
  }) : super(key: key);

  final Widget destination;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(text),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => destination));
      },
    );
  }
}
