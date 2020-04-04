import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StreamDemo'), elevation: 0.0),
      body: StreamHome()
    );
  }
}

class StreamHome extends StatefulWidget {
  @override
  _StreamHomeState2 createState() => _StreamHomeState2();
}

class _StreamHomeState2 extends State<StreamHome> {
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;

  String data = '...';

  @override
  void dispose() {
    super.dispose();
    _streamDemo.close();
  }

  @override
  void initState() {
    super.initState();

    print('create stream');
    // _streamDemo = StreamController<String>();
    _streamDemo = StreamController.broadcast();
    _sinkDemo = _streamDemo.sink;

    print('listen stream');
    _streamDemoSubscription = _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);

  
    print('init stream end');
  }

  void onData (String data) {
    print(data);
    setState(() {
      this.data = data;
    });
  }

  void onError (error) {
    print('error: $error');
  }

  void onDone () {
    print('done');
  }

  void _pauseStream () {
    print('pause stream');
    _streamDemoSubscription.pause();
  }

  void _resumeStream () {
    print('resume stream');
    _streamDemoSubscription.resume();
  }

  _cancelStream () {
    print('cancel stream');
    _streamDemoSubscription.cancel();
  }

  void _addDataToStream () async {
    print('add data to stream');

    String data = await fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  Future<String> fetchData () async {
    await Future.delayed(Duration(seconds: 2));
    // throw '出错了';
    return 'hello~';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text('$data'),
          StreamBuilder(
            stream: _streamDemo.stream,
            initialData: '...',
            builder: (context, snapshot) {
              return Text('${snapshot.data}');
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: _addDataToStream, 
                child: Text('add data')
              ),
              FlatButton(
                onPressed: _pauseStream, 
                child: Text('pause')
              ),
              FlatButton(
                onPressed: _resumeStream, 
                child: Text('resume')
              ),
              FlatButton(
                onPressed: _cancelStream, 
                child: Text('cancel')
              ),
            ]
          ),
        ],
      ),
    );
  }
}

class _StreamHomeState extends State<StreamHome> {
  StreamSubscription _streamDemoSubscription;

  @override
  void initState() {
    super.initState();
    print('create stream');
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());

    print('listen stream');
    _streamDemoSubscription = _streamDemo.listen(onData, onError: onError, onDone: onDone);
  
    print('init stream end');
  }

  void onData (String data) {
    print(data);
  }

  void onError (error) {
    print('error: $error');
  }

  void onDone () {
    print('done');
  }

  void _pauseStream () {
    print('pause stream');
    _streamDemoSubscription.pause();
  }

  void _resumeStream () {
    print('resume stream');
    _streamDemoSubscription.resume();
  }

  _cancelStream () {
    print('cancel stream');
    _streamDemoSubscription.cancel();
  }

  Future<String> fetchData () async {
    await Future.delayed(Duration(seconds: 5));
    // throw '出错了';
    return 'hello~';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: _pauseStream, 
                child: Text('pause')
              ),
              FlatButton(
                onPressed: _resumeStream, 
                child: Text('resume')
              ),
              FlatButton(
                onPressed: _cancelStream, 
                child: Text('cancel')
              ),
            ]
          ),
        ],
      ),
    );
  }
}