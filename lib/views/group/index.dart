import 'package:flutter/material.dart';
import 'package:flutter_app1/components/star_rating.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('小组'),
        ),
        body: Center(
          child: StarRating(
            rating: 8
          ),
        )
    );
  }
}
