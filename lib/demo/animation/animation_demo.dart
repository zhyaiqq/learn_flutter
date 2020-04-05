import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0
      ),
      body: AnimationHome()
    );
  }
}

class AnimationHome extends StatefulWidget {
  @override
  _AnimationHomeState createState() => _AnimationHomeState();
}

class _AnimationHomeState extends State<AnimationHome> with TickerProviderStateMixin {
  AnimationController animationDemoController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve; // 动画曲线
  
  @override
  void initState() {
    super.initState();

    animationDemoController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this
    );

    curve = CurvedAnimation(
      parent:  animationDemoController,
      curve: Curves.bounceInOut
    );

    animation = 
      Tween(begin: 32.0, end: 100.0).animate(curve);

    animationColor = 
      ColorTween(begin: Colors.red, end: Colors.black).animate(curve);

  }

  @override
  void dispose() {
    super.dispose();
    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedHeart(
        animations: [
          animation,
          animationColor
        ],
        controller: animationDemoController,
      ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart({
    this.animations,
    this.controller
  }) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse();
            break;
          default:
            controller.forward();
        }
      },
    );
  }
}


/*
 * 动画demo1
 */
class _AnimationHomeState1 extends State<AnimationHome> with TickerProviderStateMixin {
  AnimationController animationDemoController;
  Animation animation;
  
  @override
  void initState() {
    super.initState();

    animationDemoController = AnimationController(
    //   lowerBound: 32,
    //   upperBound: 100,
      duration: Duration(milliseconds: 2000),
      vsync: this
    );

    animation = Tween(begin: 32.0, end: 100.0).animate(animationDemoController);

    animationDemoController.addListener(() {
      // print('${animationDemoController.value}');
      setState(() {});
    });

    animationDemoController.addStatusListener((AnimationStatus status) {
      print(status);
    });

    // animationDemoController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(Icons.favorite),
        // iconSize: animationDemoController.value, 
        iconSize: animation.value,
        onPressed: () {
          switch (animationDemoController.status) {
            case AnimationStatus.completed:
              animationDemoController.reverse();
              break;
            default:
              animationDemoController.forward();
          }
        }
      ),
    );
  }
}