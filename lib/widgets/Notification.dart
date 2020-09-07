import 'package:flutter/cupertino.dart';

class NotificationRoute extends StatefulWidget {
  @override
  NotificationRouteState createState() {
    return new NotificationRouteState();
  }
}

class NotificationRouteState extends State<NotificationRoute> {
  String _msg="";
  @override
  Widget build(BuildContext context) {
    Widget demo1 = NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          _msg+=notification.msg+"  ";
        });
        return true;
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CupertinoButton(
              onPressed: () => MyNotification("Hi").dispatch(context),
              child: Text("Send Notification"),
            ),
            Builder(
              builder: (context) {
                return CupertinoButton(
                  //按钮点击时分发通知
                  onPressed: () => MyNotification("Hi").dispatch(context),
                  child: Text("Send Notification"),
                );
              },
            ),
            Text(_msg)
          ],
        ),
      ),
    );

    Widget demo2 = NotificationListener<MyNotification>(
      onNotification: (notification){
        print(notification.msg); //打印通知
        return false;
      },
      child: NotificationListener<MyNotification>(
          onNotification: (notification) {
            setState(() {
              _msg+=notification.msg+"  ";
            });
            return true; // 阻止冒泡了，父NotificationListener便不会再打印通知
          },
          child: Builder(
            builder: (context) {
              return CupertinoButton(
                //按钮点击时分发通知
                onPressed: () => MyNotification("Hi").dispatch(context),
                child: Text("Send Notification"),
              );
            },
          ),
      ),
    );

    //监听通知
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Notification'),),
      child: false ? demo1 : demo2,
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}