import 'dart:io';

import 'package:compare_image_test/resources/app_strings.dart';
import 'package:compare_image_test/resources/app_styles.dart';
import 'package:compare_image_test/widgets/image.dart';
import 'package:flutter/material.dart';

class ImageComparisonScreen extends StatefulWidget {
  final File firstImageFile;
  final File secondImageFile;

  const ImageComparisonScreen({
    super.key,
    required this.firstImageFile,
    required this.secondImageFile,
  });

  @override
  _ImageComparisonScreenState createState() => _ImageComparisonScreenState();
}

class _ImageComparisonScreenState extends State<ImageComparisonScreen> {
  double _sliderValue = 0.5;

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
              decoration: AppStyles.imageDecoration,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Stack(
                  children: [
                    ImageWidget(image: widget.secondImageFile),
                    ClipRect(
                      child: ImageWidget(
                        image: widget.firstImageFile,
                        widthFactor: _sliderValue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              decoration: AppStyles.sliderDecoration,
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
                style: AppStyles.appStyle20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
