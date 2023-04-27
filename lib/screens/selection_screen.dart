import 'dart:io';

import 'package:compare_image_test/resources/app_strings.dart';
import 'package:compare_image_test/resources/app_styles.dart';
import 'package:compare_image_test/screens/decode_image_screen.dart';
import 'package:compare_image_test/screens/image_comparison_screen.dart';
import 'package:compare_image_test/widgets/button.dart';
import 'package:compare_image_test/widgets/image_picker.dart';
import 'package:compare_image_test/widgets/metthod_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  File? firstImageFile;
  File? secondImageFile;
  bool isClearImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text(AppStrings.selectionScreen)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Center(
              child: Text(
                AppStrings.pickImageFromGallery,
                style: AppStyles.appStyle20,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImagePickerWidget(
                  onPressed: () async {
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        firstImageFile = File(pickedFile.path);
                      });
                    }
                  },
                  imageFile: firstImageFile,
                  isClearImage: isClearImage,
                ),
                ImagePickerWidget(
                  onPressed: () async {
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        secondImageFile = File(pickedFile.path);
                      });
                    }
                  },
                  imageFile: secondImageFile,
                  isClearImage: isClearImage,
                ),
              ],
            ),
            Center(
              child: ButtonWidget(
                onPressed: () {
                  setState(() {
                    firstImageFile = null;
                    secondImageFile = null;
                  });
                },
                color: Colors.red,
                child: const Text(AppStrings.clearImages),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                AppStrings.pickTheComparisonType,
                style: AppStyles.appStyle20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MethodButtonWidget(
                  firstImageFile: firstImageFile,
                  secondImageFile: secondImageFile,
                  textButton: AppStrings.firstMethod,
                  routeWidget: ImageComparisonScreen(
                    firstImageFile: firstImageFile,
                    secondImageFile: secondImageFile,
                  ),
                ),
                MethodButtonWidget(
                  firstImageFile: firstImageFile,
                  secondImageFile: secondImageFile,
                  textButton: AppStrings.secondMethod,
                  routeWidget: DecodeImageScreen(
                    firstImageFile: firstImageFile,
                    secondImageFile: secondImageFile,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              AppStrings.firstMethodDescriprion,
            ),
            const SizedBox(height: 20),
            const Text(
              AppStrings.secondMethodDescription,
            ),
          ],
        ),
      ),
    );
  }

  showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Center(child: Text(AppStrings.snackBarMessage)),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
