import 'dart:io';

import 'package:compare_image_test/resources/app_strings.dart';
import 'package:compare_image_test/resources/app_styles.dart';
import 'package:compare_image_test/widgets/button.dart';
import 'package:flutter/material.dart';

class MethodButtonWidget extends StatelessWidget {
  final File? firstImageFile;
  final File? secondImageFile;
  final String textButton;
  final Widget routeWidget;

  const MethodButtonWidget({
    super.key,
    required this.firstImageFile,
    required this.secondImageFile,
    required this.textButton,
    required this.routeWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ButtonWidget(
          onPressed: () {
            if (firstImageFile != null && secondImageFile != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => routeWidget,
                ),
              );
            } else {
              showSnackBar(context);
            }
          },
          color: Colors.purple,
          child: Text(
            textButton,
            style: AppStyles.appStyle14,
          ),
        ),
      ),
    );
  }

  showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Center(child: Text(AppStrings.snackBarMessage)),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
