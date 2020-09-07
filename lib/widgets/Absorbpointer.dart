import 'package:flutter/cupertino.dart';

/**
 *  AbsorbPointer可以想象成web端的遮罩, absorbing控制是否可以点击
 *  IgnorePointer
 *  IgnorePointer和IgnorePointer区别看：https://book.flutterchina.club/chapter8/listener.html
 */
class AbsorbpointerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget absorbpointer = AbsorbPointer(
      absorbing: false,
      child: CupertinoButton(
        child: Text('xx'),
        onPressed: () {print('click');},
        color: CupertinoColors.systemGreen,
      ),
    );

    Widget ignorepointer = IgnorePointer(
      ignoring: false,
      child: GestureDetector(
        onTap: () => print('点击了'),
        child: Text('点击'),
      ),
    );

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Absorbpointer'),
      ),
      child: Center(
        child: false ? absorbpointer : ignorepointer,
      ),
    );
  }
}
