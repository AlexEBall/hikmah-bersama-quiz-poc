import 'package:flutter/material.dart';

class FullSizeImage extends StatelessWidget {
  final String image;

  const FullSizeImage({@required this.image});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Image.asset('assets/images/$image.jpg'),
      fit: BoxFit.fill,
    );
  }
}
