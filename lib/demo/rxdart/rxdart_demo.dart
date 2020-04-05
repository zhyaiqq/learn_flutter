import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxdartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RxdartDemo'), elevation: 0.0),
      body: RxdartHome()
    );
  }
}


class RxdartHome extends StatefulWidget {
  @override
  _RxdartHomeState createState() => _RxdartHomeState();
}

class _RxdartHomeState extends State<RxdartHome> {
  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    super.initState();

    _textFieldSubject = PublishSubject<String>();

    _textFieldSubject
      // .map((item)=> 'item: $item')
      // .where((item) => item.length > 15)
      // .debounce(Duration(milliseconds: 500))
      .listen((data) => print(data));

  }

  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black
      ),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('input: $value');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submit: $value');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true
        ),
      ),
    );
  }
}