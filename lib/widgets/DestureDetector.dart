import 'package:flutter/cupertino.dart';

/**
 * 关于手势相关的：https://book.flutterchina.club/chapter8/listener.html
 * 手势冲突只是手势级别的，而手势是对原始指针的语义化的识别，所以在遇到复杂的冲突场景时，都可以通过Listener直接识别原始指针事件来解决冲突。
 */

class Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移
  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    // 任意拖动
    Widget drag1 = Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: Text("拖动看看"),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e){
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        )
      ],
    );

    // 单一方向上拖动
    Widget drag2 = Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          child: GestureDetector(
            child: Text('拖动'),
            //垂直方向拖动事件
            onVerticalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _top += details.delta.dy;
              });
            }
          ),
        )
      ],
    );

    // 缩放
    Widget scale1 = Center(
      child: GestureDetector(
        child: Image.network(
          'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1597991870&di=69d92b63a1ff59b2659afa28a6b28352&src=http://a0.att.hudong.com/56/12/01300000164151121576126282411.jpg',
          width: _width,
        ),
        onScaleUpdate: (ScaleUpdateDetails details) {
          print(details.scale.clamp(.8, 10.0));
          setState(() {
            //缩放倍数在0.8到10倍之间
            _width = 200*details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('拖动和缩放'),
      ),
      child: false ? drag1 : scale1,
    );
  }
}