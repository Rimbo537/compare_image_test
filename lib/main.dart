import 'package:compare_image_test/resources/app_images.dart';
import 'package:compare_image_test/resources/app_strings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _ImageComparisonScreen(),
    );
  }
}

class _ImageComparisonScreen extends StatefulWidget {
  @override
  _ImageComparisonScreenState createState() => _ImageComparisonScreenState();
}

class _ImageComparisonScreenState extends State<_ImageComparisonScreen> {
  double _sliderValue = 0.5;

  Decoration imageDecoration = BoxDecoration(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(AppStrings.imageComparison),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            Container(
              decoration: imageDecoration,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Stack(
                  children: [
                    _ImageWidget(image: AppImages.nature),
                    ClipRect(
                      child: _ImageWidget(
                        image: AppImages.river,
                        widthFactor: _sliderValue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Slider(
                value: _sliderValue,
                onChanged: (newValue) {
                  setState(() {
                    _sliderValue = newValue;
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                AppStrings.dragToSeeChanges,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  String image;
  double? widthFactor;

  _ImageWidget({required this.image, this.widthFactor});

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
