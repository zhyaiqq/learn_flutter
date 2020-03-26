import 'package:flutter/material.dart';

class RouteDemo extends StatelessWidget {
  final String title;

  RouteDemo(
    this.title
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      )
    );
  }
}