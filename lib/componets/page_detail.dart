import 'package:flutter/material.dart';
import '../modal/data.dart';

class PageDetail extends StatelessWidget {
  final Post post;

  PageDetail({
    @required this.post
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(post.imageUrl),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(post.title, style: Theme.of(context).textTheme.title),
                    Text(post.author,style: Theme.of(context).textTheme.subhead),
                    SizedBox(height: 30),
                    Text(post.description, style: Theme.of(context).textTheme.body1),
                    RaisedButton(
                      child: Text('跳转到about'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/about');  // 带名字的路由
                      }
                    )
                  ],
                )
              ),
            ]
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.keyboard_return, color: Colors.black),
        onPressed: () {
          // Navigator.of(context).pop();
          Navigator.pop(context);
        }
      )
    );
  }
}