import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  int page = 1;
  int pageSize = 10;
  bool isLoading = false; // 判断是否正在加载，防止多次触底请求
  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _getMore();
      }
    });
  }

  // 下拉刷新
  Future<Null> _onRefresh () async {
    setState(() {
      page = 1;
    });
    _getData();
  }

  // 获取数据
  void _getData () {
    final start = (page - 1) * pageSize;
    HttpRequset.request('/v2/movie/top250?start=${start}&count=${pageSize}').then((res){
      final subjects = res['subjects'];
      List<MovieItem> movies = [];
      for (var subject in subjects) {
        movies.add(MovieItem.fromMap(subject));
      }
      setState(() {
        if (page == 1) {
          this.movieList = movies;
        } else {
          this.movieList.addAll(movies);
        }
        this.isLoading = false;
      });
    });
  }

  void _getMore() {
    if (!isLoading) {
      this.isLoading = true;
      page++;
//      Future.delayed(Duration(seconds: 3), () {
        _getData();
//      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        itemCount: movieList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < movieList.length) {
            return  MovieListItem(movieList[index], index: index);
          } else {
            if (movieList.length == 0) {
              return null;
            } else {
              return loadMoreWidget();
            }
          }
        },
        controller: _scrollController
      ),
    );
  }

  Widget loadMoreWidget () {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.black12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('加载中', style: TextStyle(fontSize: 12, color: Color(0xff999999))),
            SizedBox(width: 10),
            Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          ],
        ),
      ),
    );
  }
}

