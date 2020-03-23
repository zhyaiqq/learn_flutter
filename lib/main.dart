import 'package:flutter/material.dart';
import 'components/tabItem.dart';
import 'views/home/index.dart';
import 'views/subject/index.dart';
import 'views/group/index.dart';
import 'views/mall/index.dart';
import 'views/me/index.dart';
import 'views/detail/index.dart';

void main () => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              items: [
                TabItem('home', '首页'),
                TabItem('subject', '书影音'),
                TabItem('group', '小组'),
                TabItem('mall', '市集'),
                TabItem('me', '我的')
              ],
              onTap: (int value) {
                setState(() {
                  _currentIndex = value;
                });
              }
          ),
        body: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            HomePage(),
            SubjectPage(),
            GroupPage(),
            MallPage(),
            MePage()
          ],
        )
      ),
      routes: <String, WidgetBuilder> {
        '/a': (BuildContext context) => DetailPage(),
        '/b': (BuildContext context) => DetailPage(),
        '/c': (BuildContext context) => DetailPage()
      }
    );
  }
}