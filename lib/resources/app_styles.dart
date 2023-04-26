import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle appStyle20 = TextStyle(fontSize: 20);

  static const TextStyle appStyle14 = TextStyle(fontSize: 14);

  static Decoration imageDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(16.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 4,
        // Сдвиг тени на 2 пикселя вправо и вниз
        offset: const Offset(2, 2),
      ),
    ],
  );

  static Decoration sliderDecoration = BoxDecoration(
    color: Colors.grey[300],
    borderRadius: BorderRadius.circular(16.0),
  );
}
