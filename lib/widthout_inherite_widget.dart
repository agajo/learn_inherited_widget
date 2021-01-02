// TODO: この例消す

import 'package:flutter/material.dart';

class WithoutInheritedWidget extends StatefulWidget {
  const WithoutInheritedWidget();

  @override
  WithoutInheritedWidgetState createState() => WithoutInheritedWidgetState();
}

class WithoutInheritedWidgetState extends State<WithoutInheritedWidget> {
  String text = 'THE TEXT!!';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WidgetA(),
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA();
  @override
  Widget build(BuildContext context) {
    return WidgetB();
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB();
  @override
  Widget build(BuildContext context) {
    final text =
        context.findAncestorStateOfType<WithoutInheritedWidgetState>().text;
    return Text(text);
  }
}
