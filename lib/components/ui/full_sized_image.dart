import 'package:flutter/material.dart';

class FullSizeImage extends StatelessWidget {
  final String image;

  FullSizeImage({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage(
            'assets/images/$image.jpg',
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
