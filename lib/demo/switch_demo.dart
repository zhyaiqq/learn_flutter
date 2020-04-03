import 'package:flutter/material.dart';
class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchItemA = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwitchDemo'),
        elevation: 0.0
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
              value: _switchItemA, 
              onChanged: (value) {
                setState(() {
                  _switchItemA = value;
                });
              },
              title: Text('Switch Item A'),
              subtitle: Text('Description'),
              secondary: Icon(_switchItemA ? Icons.visibility : Icons.visibility_off),
              selected: _switchItemA,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Switch(
                //   value: _switchItemA, 
                //   activeColor: Colors.purple,  // 开时候圆形颜色
                //   activeTrackColor: Colors.red, // 开时候背景颜色
                //   inactiveTrackColor: Colors.black, // 关时候的背景颜色
                //   inactiveThumbColor: Colors.blue, // 关时候圆形颜色
                //   onChanged: (value) {
                //     setState(() {
                //       _switchItemA = value;
                //     });
                //   }
                // )
              ])
          ],
        ),
      ),
    );
  }
}