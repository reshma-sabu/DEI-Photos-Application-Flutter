import 'dart:io';

import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/common_functions.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class PreviewPurchasedImage extends StatelessWidget {
  final String image;
  const PreviewPurchasedImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ConstColors.DIGreen,
              )),
          title: const Text(
            'Photos',
            style: TextStyle(
              color: ConstColors.DIGreen,
              fontFamily: DIConstants.SkiaFont,
              fontSize: 20,
              //figma weight is 400
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                icon: Image.network(
                  image,
                  height: 24,
                  width: 24,
                ),
                onPressed: () {
                  shareImageFromAssets(
                      assetPath: 'assets/images/downloadedImage.png',
                      fileName: 'downloadedImage.png');
                },
              ),
            ),
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Image.network(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        )));
  }

  void _shareContent() async {
    final ByteData byteData = await rootBundle.load(image);
    final Uint8List list = byteData.buffer.asUint8List();
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/$image').create();
    file.writeAsBytesSync(list);
    Share.shareXFiles([XFile(file.path)]);
  }
}
