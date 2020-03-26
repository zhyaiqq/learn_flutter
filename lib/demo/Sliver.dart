import 'package:flutter/material.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverWidget2();
  }
}

class SliverWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('标题'),
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('subtitle'),
            background: Image.network('http://k.zol-img.com.cn/sjbbs/7692/a7691515_s.jpg', fit: BoxFit.cover),
          ),
          // pinned: true, // 头部随滚动固定
          // snap: true,
          // floating: true
        ),
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 100,
                color: Colors.blue,
                child: Center(child: Text('item $index')),
              );
            }, childCount: 10),
          )
        )
      ],
    );
  }
}

class SliverWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.0
          ),
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) => Container(
            color: Colors.blue,
            child: Center(child: Text('item $index'))
          ), childCount: 5),
        )
      ],
    );
  }
}