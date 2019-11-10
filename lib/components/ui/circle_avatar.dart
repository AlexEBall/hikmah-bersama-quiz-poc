import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  const CircleImage(
      {@required this.height, @required this.width, @required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/$image.png'),
        ),
      ),
    );
  }
}
