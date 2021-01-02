import 'package:flutter/material.dart';

import 'just_access.dart' as justAccess;
import 'update_message_data.dart' as updateMessage;

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          PageButton(text: '単に値を取得する例', destination: justAccess.JustAccess()),
          PageButton(
              text: 'MessageDataを上書きする例',
              destination: updateMessage.UpdateMessage()),
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
