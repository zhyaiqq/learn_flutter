import 'package:flutter/material.dart';
import '../modal/data.dart';
import '../componets/page_detail.dart';

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
        margin: EdgeInsets.only(left: 10, right: 10, top:10, bottom: 30),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.network(posts[index].imageUrl),
                SizedBox(height: 10),
                Text(posts[index].title, style: TextStyle(fontSize: 24)),
                Text(posts[index].author, style: TextStyle(fontSize: 20, color: Colors.black38))
              ]
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.3),
                  highlightColor: Colors.white.withOpacity(0.1),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageDetail(post:posts[index])));
                  }
                ),
              )
            )
          ],
        )
      ), 
      itemCount: posts.length
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
