import 'package:flutter/material.dart';

class NewsFeedSkeletonWidget extends StatefulWidget {
  final double height;
  final double width;

  NewsFeedSkeletonWidget({Key key, this.height = 20, this.width = 200})
      : super(key: key);

  createState() => NewsFeedSkeletonWidgetState();
}

class NewsFeedSkeletonWidgetState extends State<NewsFeedSkeletonWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation gradientPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);

    gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )..addListener(() {
        setState(() {});
      });

    _controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(gradientPosition.value, 0),
              end: Alignment(-1, 0),
              colors: [Colors.black12, Colors.black26, Colors.black12])),
    );
  }
}
