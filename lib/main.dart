import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('我是标题')
        ),
        body: ContentWidget()
      )
    );
  }
}
class ContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: <Widget>[
          ItemWidget.fromMap({'title': '标题1', 'tip': 'www', 'imgUrl': 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'}),
          ItemWidget.fromMap({'title': '标题2', 'tip': 'www', 'imgUrl': 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'}),
          ItemWidget.fromMap({'title': '标题3', 'tip': 'www', 'imgUrl': 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'})
        ],
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  String title;
  String tip;
  String imageUrl;

  ItemWidget({this.title, this.tip, this.imageUrl});

  ItemWidget.fromMap(Map<String, Object> map) {
    this.title = map['title'];
    this.tip = map['tip'];
    this.imageUrl = map['imgUrl'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all()
      ),
      child: Column(
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 20)),
          Text(tip),
          SizedBox(height: 10),
          Image.network(imageUrl)
        ],
      ),
    );
  }
}
