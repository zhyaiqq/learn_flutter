import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioItemA = 1;

  void _handleRadioValueChanged (value) {
    setState(() {
      _radioItemA = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioDemo'),
        elevation: 0.0
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('RadioGroupValue $_radioItemA'),
            SizedBox(height: 32),
            RadioListTile(
              value: 0,
              groupValue: _radioItemA,
              onChanged: _handleRadioValueChanged,
              title: Text('Options A'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.filter_1),
              selected: _radioItemA == 0,
            ),
            RadioListTile(
              value: 1,
              groupValue: _radioItemA,
              onChanged: _handleRadioValueChanged,
              title: Text('Options B'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.filter_2),
              selected: _radioItemA == 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Radio(
                //   value: 0, 
                //   groupValue: _radioItemA, 
                //   onChanged: (value) {
                //     setState(() {
                //       _radioItemA = value;
                //     });
                //   }
                // ),
                // Radio(
                //   value: 1, 
                //   groupValue: _radioItemA, 
                //   onChanged: (value) {
                //     setState(() {
                //       _radioItemA = value;
                //     });
                //   }
                // ),
              ],
            )
          ],
        ),
      )
    );
  }
}