import 'dart:io';

import 'package:compare_image_test/resources/app_strings.dart';
import 'package:compare_image_test/resources/app_styles.dart';
import 'package:compare_image_test/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart';

class DecodeImageScreen extends StatefulWidget {
  File firstImageFile;
  File secondImageFile;

  DecodeImageScreen({
    super.key,
    required this.firstImageFile,
    required this.secondImageFile,
  });

  @override
  State<DecodeImageScreen> createState() => _DecodeImageScreenState();
}

class _DecodeImageScreenState extends State<DecodeImageScreen> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(AppStrings.decodeImage),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'The result: $text',
                style: AppStyles.appStyle20,
              ),
            ),
            const SizedBox(height: 20),
            ButtonWidget(
              onPressed: () async {
                decodeImageFiles(widget.firstImageFile, widget.secondImageFile);
              },
              color: Colors.grey,
              child: const Text(
                AppStrings.decodeImage,
                style: AppStyles.appStyle20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  decodeImageFiles(File firstImageFile, File secondImageFile) {
    final image1 = decodeImage(firstImageFile.readAsBytesSync());
    final image2 = decodeImage(secondImageFile.readAsBytesSync());

    if (image1?.width != image2?.width || image1?.height != image2?.height) {
      setState(() {
        text = AppStrings.imageErrorMessage;
      });
    } else {
      var diff = 0;
      for (var y = 0; y < image1!.height; ++y) {
        for (var x = 0; x < image1.width; ++x) {
          final c1 = image1.getPixel(x, y);
          final c2 = image2?.getPixel(x, y);
          if (c1 != c2) {
            ++diff;
          }
        }
      }

      if (diff == 0) {
        setState(() {
          text = AppStrings.imageIdentical;
        });
      } else {
        setState(() {
          text = 'The images differ by $diff pixels';
        });
      }
    }
  }
}
