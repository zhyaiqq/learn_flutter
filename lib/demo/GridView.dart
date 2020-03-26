import 'package:flutter/material.dart';

const List<String> dataList = ['数据1', '数据2', '数据3', '数据4', '数据5', '数据6', '数据7'];

class GriViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewWidget5();
  }
}


class GridViewWidget5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0
      ), 
      childrenDelegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          // width: 50,
          // height: 100,
          color: Color(0xffdddddd),
          child: Center(child: Text('item $index')),
        );
      }, childCount: 10)
    );
  }
}


class GridViewWidget4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 200,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: dataList.map((String title) {
        return Container(
          // width: 50,
          // height: 100,
          color: Color(0xffdddddd),
          child: Center(child: Text(title)),
        );
      }).toList()
    );
  }
}

class GridViewWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // 一行显示几个
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: <Widget>[
        Container(
          // width: 50,
          height: 100,
          color: Color(0xffdddddd),
          child: Center(child: Text('item')),
        ), 
        Container(
          width: 100,
          height: 100,
          color: Color(0xffdddddd),
          child: Center(child: Text('item')),
        ), 
        Container(
          width: 100,
          height: 100,
          color: Color(0xffdddddd),
          child: Center(child: Text('item')),
        ), 
        Container(
          width: 100,
          height: 100,
          color: Color(0xffdddddd),
          child: Center(child: Text('item')),
        ), 
      ],
    );
  }
}

class GridViewWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.0
      ), 
      itemBuilder: (BuildContext context, int index) => Container(
        // height: 100,
        color: Color(0xffdddddd),
        child: Center(child: Text('item $index')),
      ), 
    );
  }
}

class GridViewWiget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0
      ),
      children: <Widget>[
        Container(
          height: 100,
          color: Color(0xffdddddd),
          child: Center(child: Text('item')),
        ), 
        Container(
          height: 100,
          color: Color(0xffdddddd),
          child: Center(child: Text('item')),
        ), 
        Container(
          height: 100,
          color: Color(0xffdddddd),
          child: Center(child: Text('item')),
        ), 
        Container(
          height: 100,
          color: Color(0xffdddddd),
          child: Center(child: Text('item')),
        ), 
        Container(
          height: 100,
          color: Color(0xffdddddd),
          child: Center(child: Text('item')),
        ), 
      ],
    );
  }
}