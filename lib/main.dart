import 'package:flutter/material.dart';
import './demo/drawer.dart';
import './demo/ListView.dart';
import './demo/GridView.dart';
import './demo/PageView.dart';
import './demo/Sliver.dart';
import './demo/routes.dart';
import './demo/form.dart';
import './demo/material_components.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.yellow,
        accentColor: Colors.blue
      ),
      initialRoute: '/mdc',
      routes: {
        '/': (BuildContext context) => Home(),
        '/about': (BuildContext context) => RouteDemo('about'),
        '/form': (BuildContext context) => FormDemo(),
        '/mdc': (context) => MaterialComponets(),
      }
    );
  }
}


class Home  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child:  Scaffold(
        appBar: AppBar(
          title: Text('首页'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => print('search')
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'List', icon: Icon(Icons.card_giftcard)),
              Tab(text: 'sliver', icon: Icon(Icons.directions_walk))
            ]
          ),
        ),
        body: TabBarView(
          children: [
            ListViewDemo(),
            SliverDemo()
          ]
        ),
        drawer: DrawerWidget()
      )
    );
  }
}
