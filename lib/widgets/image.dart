import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  String image;
  double? widthFactor;

  ImageWidget({super.key, required this.image, this.widthFactor});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      widthFactor: widthFactor,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 300,
      ),
    );
  }
}
