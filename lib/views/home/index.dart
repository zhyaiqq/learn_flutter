import 'package:flutter/material.dart';
import 'package:flutter_app1/http/http.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: HomeBody()
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    HttpRequset.request('/v2/movie/top250?start=0&count=20').then((res){
      print(res['subjects']);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

