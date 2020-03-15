import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double rating; // 当前评分
  final double maxRating; // 最高评分
  final Widget unselectedImage;
  final Widget selectedImage;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;

  StarRating({
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 20,
    this.unselectedColor = Colors.black26,
    this.selectedColor = Colors.orange,
    Widget unselectedImage,
    Widget selectedImage
  }): unselectedImage = unselectedImage ?? Icon(Icons.star, size: size, color: unselectedColor),
      selectedImage = selectedImage ?? Icon(Icons.star, size: size, color: selectedColor);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: getUnSelectImage()
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: getSelectImage()
        )
      ],
    );
  }

  // 获取评星 未选中的星星
  List<Widget> getUnSelectImage() {
    return List.generate(widget.count, (index) => widget.unselectedImage);
  }

  // 获取选中的星
  List<Widget> getSelectImage() {
    double oneValue = widget.maxRating / widget.count; // 一个星星多少分
    int wholeCount = (widget.rating / oneValue).floor(); // 完整选中星星的个数
    double leftValue = widget.rating - wholeCount * oneValue; // 剩余分数
    double leftRatio = leftValue / oneValue; // 剩余分数比例

    // 完整的星星数
    List<Widget> selectedImages = [];
    for(int i = 0; i < wholeCount; i++) {
      selectedImages.add(widget.selectedImage);
    }

   // 剩余的星星
    Widget leftStar = ClipRect(
      clipper: MyRectClipper(width: leftRatio * widget.size),
      child: widget.selectedImage,
    );
    selectedImages.add(leftStar);

    return selectedImages;
  }
}


class MyRectClipper extends CustomClipper<Rect> {
  final double width;

  MyRectClipper({this.width});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MyRectClipper oldClipper) {
    return width != oldClipper.width;
  }
}