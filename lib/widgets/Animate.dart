import 'package:flutter/cupertino.dart';

/**
 * AnimatedAlign  AnimatedPadding  AnimatedContainer  AnimatedDefaultTextStyle  AnimatedOpacity  AnimatedPositioned
 */

class AnimateDemo extends StatefulWidget {
  @override
  _AnimateDemoState createState() => _AnimateDemoState();
}

class _AnimateDemoState extends State<AnimateDemo> {
  var _align = Alignment.topLeft;
  double _padding = 10;
  double _height = 100;
  Color _color = CupertinoColors.activeGreen;
  TextStyle _style = TextStyle(color: CupertinoColors.black);
  double _opacity = 0.1;
  double _left = 20;
  int _count = 0;
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    Widget demo1 = AnimatedAlign(
      child: CupertinoButton(
        child: Text('AnimatedAlign'),
        onPressed: () {
          setState(() {
            _align = Alignment.bottomLeft;
          });
        },
      ),
      alignment: _align,
      duration: Duration(seconds: 2),
    );

    Widget demo2 = AnimatedPadding(
      child: CupertinoButton(
        child: Text('AnimatedPadding'),
        onPressed: () {
          setState(() {
            _padding = 20;
          });
        },
      ),
      padding: EdgeInsets.all(_padding),
      duration: Duration(seconds: 2),
    );

    Widget demo3 = AnimatedContainer(
      duration: Duration(seconds: 2),
      height: _height,
      color: _color,
      child: CupertinoButton(
        onPressed: () {
          setState(() {
            _height = 150;
            _color = CupertinoColors.activeBlue;
          });
        },
        child: Text(
          "AnimatedContainer",
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
    );

    Widget demo4 = AnimatedDefaultTextStyle(
      child: GestureDetector(
        child: Text("点我文字换样式"),
        onTap: () {
          setState(() {
            _style = TextStyle(
              color: CupertinoColors.systemBlue,
              decorationStyle: TextDecorationStyle.solid,
              decorationColor: CupertinoColors.activeGreen,
            );
          });
        },
      ),
      style: _style,
      duration: Duration(seconds: 2),
    );

    Widget demo5 = AnimatedOpacity(
      child: CupertinoButton(
        child: Text('AnimatedOpacity'),
        onPressed: () {
          setState(() {
            _opacity = 1;
          });
        },
      ),
      opacity: _opacity,
      duration: Duration(seconds: 2),
    );

    Widget demo6 = Stack(
      children: <Widget>[
        AnimatedPositioned(
          duration: Duration(seconds: 2),
          left: _left,
          child: CupertinoButton(
            onPressed: () {
              setState(() {
                _left = 100;
              });
            },
            child: Text("AnimatedPositioned"),
          ),
        )
      ],
    );

    /**
     * 和AnimatedSwitcher不同的是AnimatedCrossFade是针对两个子元素，而AnimatedSwitcher是在一个子元素的新旧值之间切换。
     */
    Widget demo7 = Column(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            //执行缩放动画
//            return ScaleTransition(child: child, scale: animation);
            return FadeTransition(child: child, opacity: animation);
          },
          child: Text(
            '$_count',
            //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
            key: ValueKey<int>(_count),
            style: CupertinoTheme.of(context).textTheme.actionTextStyle,
          ),
        ),
        CupertinoButton(
          child: const Text('点我+1',),
          onPressed: () {
            setState(() {
              _count += 1;
            });
          },
        ),
      ],
    );

    Widget demo8 = Column(
      children: [
        AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              var tween=Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
              return MySlideTransition(
                child: child,
                position: tween.animate(animation),
              );
            },
            child: Text(
              '$_count',
              //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
              key: ValueKey<int>(_count),
              style: CupertinoTheme.of(context).textTheme.actionTextStyle,
            )
        ),
        CupertinoButton(
          child: const Text('点我+1',),
          onPressed: () {
            setState(() {
              _count += 1;
            });
          },
        )
      ],
    );

    Widget demo9 = Column(
      children: [
        AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransitionX(
                child: child,
                direction: AxisDirection.down, //上入下出
                position: animation,
              );
            },
            child: Text(
              '$_count',
              //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
              key: ValueKey<int>(_count),
              style: CupertinoTheme.of(context).textTheme.actionTextStyle,
            )
        ),
        CupertinoButton(
          child: const Text('点我+1',),
          onPressed: () {
            setState(() {
              _count += 1;
            });
          },
        )
      ],
    );

    Widget demo10 = Column(
      children: [
        AnimatedCrossFade(
          duration: const Duration(seconds: 3),
          firstChild: Text('first'),
          secondChild: Text('second'),
          crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
        CupertinoButton(
          child: const Text('点我+1',),
          onPressed: () {
            setState(() {
              _first = !_first;
            });
          },
        )
      ],
    );

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('动画'),
      ),
      child: demo10,
    );
  }
}

class MySlideTransition extends AnimatedWidget {
  MySlideTransition({
    Key key,
    @required Animation<Offset> position,
    this.transformHitTests = true,
    this.child,
  })
      : assert(position != null),
        super(key: key, listenable: position) ;

  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Offset offset=position.value;
    //动画反向执行时，调整x偏移，实现“从左边滑出隐藏”
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}

class SlideTransitionX extends AnimatedWidget {
  SlideTransitionX({
    Key key,
    @required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    this.child,
  })
      : assert(position != null),
        super(key: key, listenable: position) {
    // 偏移在内部处理
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
    }
  }


  Animation<double> get position => listenable;

  final bool transformHitTests;

  final Widget child;

  //退场（出）方向
  final AxisDirection direction;

  Tween<Offset> _tween;

  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}