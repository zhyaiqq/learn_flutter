import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app1/components/dashed_line.dart';
import 'package:flutter_app1/components/star_rating.dart';
import 'package:flutter_app1/models/movie_item_modal.dart';

class MovieListItem extends StatelessWidget {
  MovieItem movie;

  MovieListItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 10, color: Colors.black12))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getRankWidget(),
          SizedBox(height: 10),
          getMovieContent(),
          SizedBox(height: 10),
          getOriginalTitleWidget()
        ],
      ),
    );
  }

  Widget getRankWidget () {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Colors.orangeAccent
      ),
      child: Text(
        'NO.${movie.rank}'
      )
    );
  }

  Widget getMovieContent () {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getMovieImage(),
          getMovieDesc(),
          getDashedWidget(),
          getWishWidget()
        ],
      ),
    );
  }
  
  Widget getMovieImage () {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(movie.imgUrl, height: 150)
    );
  }

  Widget getMovieDesc () {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTitleWidget(),
            getRatingWidget(),
            getInfoWidget()
          ],
        ),
      )
    );
  }

  Widget getTitleWidget () {
//    return Row(
//      children: <Widget>[
//        Icon(Icons.play_circle_outline, color: Colors.deepOrangeAccent),
//        Text(movie.title, style: TextStyle(fontWeight: FontWeight.bold)),
//        Text('(${movie.playDate})', style: TextStyle(color: Color(0xff999999)))
//      ],
//    );
  // 采用上面方式如果文字多了会溢出报错，做如下修改让文字超出自动换行
    return Stack(
      children: <Widget>[
        Icon(Icons.play_circle_outline, color: Colors.deepOrangeAccent, size: 18),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '     '),
              TextSpan(text: '${movie.title}', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: '(${movie.playDate})', style: TextStyle(color: Color(0xff999999)))
            ]
          ),
          maxLines: 2
        )
      ],
    );
  }

  Widget getRatingWidget () {
    return Row(
      children: <Widget>[
        StarRating(rating: movie.rating),
        SizedBox(height: 4),
        Text('${movie.rating}')
      ],
    );
  }

  Widget getInfoWidget () {
    final genres = movie.genres.join(' ');
    final director = movie.director.name;
    var actorStr = '';
    for (var actor in movie.actors) {
      actorStr += actor.name + ' ';
    }
    return Text(
      '$genres/$director/$actorStr',
      maxLines: 2,
      overflow: TextOverflow.ellipsis
    );
  }

  Widget getDashedWidget () {
    return Container(
      height: 90,
      child: DashedLine(
        axis: Axis.vertical,
        dashedWidth: 1,
        dashedHeight: 4,
        count: 14
      ),
    );
  }

  Widget getWishWidget () {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/home/wish.png', width: 32),
          SizedBox(height: 4),
          Text('想看')
        ],
      ),
    );
  }

  Widget getOriginalTitleWidget () {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0x19000000)
      ),
      child: Text(
        movie.originalTitle
      )
    );
  }
}
