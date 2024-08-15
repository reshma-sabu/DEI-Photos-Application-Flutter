import 'dart:io';
import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class PreviewPurchasedImage extends StatelessWidget {
  final String localImagePath; // Local file path of the image
  const PreviewPurchasedImage({super.key, required this.localImagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            'assets/images/backButton.png',
            height: 19,
            width: 10.24,
          ),
        ),
        title: const Text(
          'Photos',
          style: TextStyle(
            color: ConstColors.DIGreen,
            fontFamily: DIConstants.SkiaFont,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Image.asset(
                'assets/images/share.png',
                height: 24,
                width: 24,
              ),
              onPressed: () {
                _shareImage(localImagePath);
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Image.file(
            File(localImagePath), // Load the image from the local file
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }

  void _shareImage(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        // Share the image file from local storage
        Share.shareXFiles([XFile(file.path)]);
      } else {
        throw Exception('File does not exist');
      }
    } catch (e) {
      print('Error sharing image: $e');
    }
  }
}
