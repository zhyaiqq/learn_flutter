import 'package:flutter/material.dart';
import './demo/ListView.dart';
import './demo/GridView.dart';
import './demo/PageView.dart';
import './demo/Sliver.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow
      ),
      home: DefaultTabController(
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
                Tab(text: 'WALK', icon: Icon(Icons.directions_walk))
              ]
            ),
          ),
          body: TabBarView(
            children: [
              GriViewDemo(),
              SliverDemo()
            ]
          ),
          drawer: DrawerWidget()
        )
      )
    );
  }
}


class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585043760245&di=4c3f35fb8badaf63253a542f9a41cf66&imgtype=0&src=http%3A%2F%2Ffile02.16sucai.com%2Fd%2Ffile%2F2014%2F1006%2Fe94e4f70870be76a018dff428306c5a3.jpg'
                ),
                colorFilter: ColorFilter.mode(Colors.yellow, BlendMode.hardLight)
              )
            ),
            accountEmail: Text('7323232@qq.com'),
            accountName: Text('username'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585043760248&di=254b1495adb8e154e2500d78d8837db7&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F14%2F75%2F01300000164186121366756803686.jpg'
              )
            )
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile')
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings')
          ),
        ],
      ),
    );
  }
}

