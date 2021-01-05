import 'package:flutter/material.dart';
import 'package:learn_inherited_widget/count_manager.dart';

class MainWidget extends StatelessWidget {
  const MainWidget();
  @override
  Widget build(BuildContext context) {
    // CountManagerの傘下に、ボタンと表示用テキストを配置します。
    return CountManager(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const ButtonWidget(),
            const ShowCount(),
          ],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget();
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: const Text('inclement!!'),
        onPressed: () {
          // ofメソッドでCountManagerの状態更新用メソッドにアクセスします！
          // ボタンをリビルドする必要はないので、listen:falseとします。
          CountManager.of(context, listen: false).inclement();
        });
  }
}

class ShowCount extends StatelessWidget {
  const ShowCount();
  @override
  Widget build(BuildContext context) {
    // ofメソッドでCountManagerのプロパティにアクセスします！
    // 更新を反映する必要があるので、listenはデフォルト(true)にします。
    final count = CountManager.of(context).count;
    return Text('count: $count');
  }
}
