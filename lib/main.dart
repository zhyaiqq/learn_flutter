import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/widgets/Absorbpointer.dart';
import 'package:flutter_app1/widgets/Animate.dart';
import 'package:flutter_app1/widgets/DestureDetector.dart';
import 'package:flutter_app1/widgets/Notification.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        theme: CupertinoThemeData(
          primaryColor: CupertinoColors.black,
          barBackgroundColor: CupertinoColors.systemGreen,
        ),
        color: CupertinoColors.activeOrange,
        debugShowCheckedModeBanner: false,
      routes: {
        '/AbsorbpointerDemo': (context) => AbsorbpointerDemo(),
        '/NotificationRoute': (context) => NotificationRoute(),
        '/animate': (context) => AnimateDemo(),
        '/drag': (context) => Drag(),
      },
        home: Myhome()
    );
  }
}


class Myhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('demo'),
      ),
      child: ListView(
        children: [
          titleItem(context, 'IgnorePointer和IgnorePointer', '/AbsorbpointerDemo'),
          titleItem(context, 'Notification', '/NotificationRoute'),
          titleItem(context, '拖拽', '/drag'),
          titleItem(context, '动画', '/animate')
        ],
      )
    );
  }

  Widget titleItem (BuildContext context, String title, String route) {
    return GestureDetector(
        child: Container(
          color: CupertinoColors.activeGreen.withOpacity(0.4),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 15),
          child: Text(title),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(route);
        }
    );
  }
}
