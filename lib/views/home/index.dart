import 'package:flutter/material.dart';
import 'package:flutter_app1/http/http.dart';
import 'package:flutter_app1/models/movie_item_modal.dart';
import 'sub/movie_item.dart';

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
  List<MovieItem> movieList = [];

  @override
  void initState() {
    super.initState();
    HttpRequset.request('/v2/movie/top250?start=0&count=20').then((res){
      final subjects = res['subjects'];
      List<MovieItem> movies = [];
      for (var subject in subjects) {
        movies.add(MovieItem.fromMap(subject));
      }
      print(subjects[1]['directors']);
      setState(() {
        this.movieList = movies;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (BuildContext context, int index) {
        return MovieListItem(movieList[index]);
      }
    );
  }
}

