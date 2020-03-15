import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/components/dashed_line.dart';

class SubjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('书影音'),
        ),
        body: Center(
          child: Container(
            height: 500,
            child: DashedLine(
              axis: Axis.horizontal,
              dashedHeight: 1,
              dashedWidth: 4,
              count: 30
            ),
          ),
        )
    );
  }
}
