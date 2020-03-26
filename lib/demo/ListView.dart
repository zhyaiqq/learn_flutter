import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListViewWidget3();
  }
}


class ListViewWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Container(
        margin: EdgeInsets.all(10),
        height: 100,
        color: Color(0xffdddddd),
        child: Center(child: Text('item $index')),
      ), 
      itemCount: 10
    );
  }
}


class ListViewWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      // semanticChildCount: 10,
      childrenDelegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          height: 100,
          color: Color(0xffdddddd),
          child: Center(child: Text('item $index')),
        );
      })
    );
  }
}

class ListViewWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) => Container(
        margin: EdgeInsets.all(10),
        height: 100,
        color: Color(0xffdddddd),
        child: Center(child: Text('item $index')),
      ), 
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 10,
      ), 
      itemCount: 10
    );
  }
}
