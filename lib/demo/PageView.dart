import 'package:flutter/material.dart';

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageViewWidget1();
  }
}

class PageViewWidget2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PageViewState();
  }
}

class PageViewState extends State<PageViewWidget2> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (int index) => print('page $index'),
      controller: PageController(
        initialPage: 1,
        keepPage: false,
        viewportFraction: 0.8
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => Container(
        color: Colors.blue,
        child: Center(child: Text('item $index', style: TextStyle(fontSize: 20)))
      )
    );
  }
}

class PageViewWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      onPageChanged: (int index) => print('page $index'),
      controller: PageController(
        initialPage: 1,
        keepPage: false,
        viewportFraction: 0.8
      ),
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          child: Text('item')
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.purple,
          child: Text('item')
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
          child: Text('item')
        )
      ],
    );
  }
}