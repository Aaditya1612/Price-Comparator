import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  const MainImage({
    Key? key,
    this.imageHeight = 400.0,
    this.circleRadius = 180.0,
    this.bottom = 50.0,
    this.imageWidth,
  }) : super(key: key);
  final double imageHeight;
  final double circleRadius;
  final double bottom;
  final double? imageWidth;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: circleRadius,
          backgroundColor: Color.fromRGBO(157, 170, 242, 1),
        ),
        Positioned(
          bottom: bottom,
          child: Image.asset(
            'assets/images/FloatDoodle (4).png',
            height: imageHeight,
            width: imageWidth ?? mediaQuery.width * 0.25,
          ),
        ),
      ],
    );
  }
}
