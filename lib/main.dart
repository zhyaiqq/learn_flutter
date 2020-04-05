import 'package:flutter/material.dart';
import './demo/drawer.dart';
import './demo/ListView.dart';
import './demo/GridView.dart';
import './demo/PageView.dart';
import './demo/Sliver.dart';
import './demo/routes.dart';
import './demo/form.dart';
import './demo/material_components.dart';
import './demo/state/state_management_demo.dart';
import './demo/stream/stream_demo.dart';
import './demo/rxdart/rxdart_demo.dart';
import './demo/bloc/bloc_demo.dart';

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
      initialRoute: '/bloc',
      routes: {
        '/': (BuildContext context) => Home(),
        '/about': (BuildContext context) => RouteDemo('about'),
        '/form': (BuildContext context) => FormDemo(),
        '/mdc': (context) => MaterialComponets(),
        '/state': (context) => StateManagementDemo(),
        '/stream': (context) => StreamDemo(),
        '/rxdart': (context) => RxdartDemo(),
        '/bloc': (context) => BlocDemo(),
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
