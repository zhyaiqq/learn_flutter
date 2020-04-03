import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary
            )
          ),
          child: OutlineButton(
            onPressed: (){},
            child: Text('Button'),
            splashColor: Colors.grey,
          ),
        ),
        SizedBox(width: 15),
        OutlineButton.icon(
          onPressed: (){},
          icon: Icon(Icons.add),
          label: Text('Button')
        )
      ],
    );
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          splashColor: Colors.grey,
          child: Text('Button'),
          onPressed: () {},
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          onPressed: () {}, 
          icon: Icon(Icons.add), 
          label: Text('Add'),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent
        )
      ],
    );
    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5)
              // )
              shape: StadiumBorder()
            )
          ), 
          child: RaisedButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey,
            elevation: 0.0,
          )
        ),
        SizedBox(width: 15),
        RaisedButton.icon(
          onPressed: () {}, 
          icon: Icon(Icons.add), 
          label: Text('Button')
        )
      ],
    );
    final Widget fixedWidthbutton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 300.0,
          child: OutlineButton(
            onPressed: (){},
            child: Text('Button'),
          ),
        )
      ],
    );
    final Widget expandedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: OutlineButton(
            onPressed: (){},
            child: Text('Button'),
            splashColor: Colors.grey,
            borderSide: BorderSide(
              color: Colors.black
            ),
            highlightedBorderColor: Colors.black,
            textColor: Colors.black,
          )
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: OutlineButton(
            onPressed: (){},
            child: Text('Button'),
            splashColor: Colors.grey,
            borderSide: BorderSide(
              color: Colors.black
            ),
            highlightedBorderColor: Colors.black,
            textColor: Colors.black,
          )
        ),
      ],
    );
    final Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ButtonBar(
          children: <Widget>[
            OutlineButton(
              onPressed: () {},
              child: Text('button'),
              splashColor: Colors.blueGrey, // 点击渐变颜色
              borderSide: BorderSide( // 边框颜色
                color: Colors.black
              ),
              highlightedBorderColor: Colors.grey, // 边框点击高亮颜色
              textColor: Colors.blue, // 文字颜色
            ),
            OutlineButton(
              onPressed: (){},
              child: Text('Button'),
              splashColor: Colors.grey,
              borderSide: BorderSide(
                color: Colors.black
              ),
              textColor: Colors.black,
              highlightedBorderColor: Colors.black,
            )
          ]
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            outlineButtonDemo,
            flatButtonDemo,
            raisedButtonDemo,
            fixedWidthbutton,
            expandedButton,
            buttonBarDemo,
          ]),
      )
    );
  }
}