import 'dart:io';

import 'package:compare_image_test/resources/app_strings.dart';
import 'package:compare_image_test/widgets/button.dart';
import 'package:flutter/material.dart';

class ImagePickerWidget extends StatefulWidget {
  bool isClearImage;
  VoidCallback onPressed;
  File? imageFile;

  ImagePickerWidget({
    super.key,
    required this.isClearImage,
    required this.onPressed,
    this.imageFile,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            height: 130,
            width: 130,
            color: Colors.grey[300],
            child: widget.imageFile == null
                ? const Icon(Icons.add_a_photo_outlined)
                : Image.file(widget.imageFile as File),
          ),
        ),
        ButtonWidget(
          onPressed: widget.onPressed,
          child: const Text(AppStrings.pickImage),
        ),
      ],
    );
  }
}
