import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ImageDownloadedBottomToastWidget extends StatelessWidget {
  const ImageDownloadedBottomToastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73,
      width: double.infinity,
      color: ConstColors.DIGreen,
      child: Padding(
        padding: const EdgeInsets.only(left: 42, right: 20),
        child: Row(
        children: [
          const Text(DIConstants.imageSavedMsg,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: DIConstants.AvertaDemoPE,
            color: ConstColors.DIWhite
          ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset('assets/images/saveImage.png',
            height: 24,
            width: 24,
            // alignment: AlignmentDirectional.centerEnd,
            ),
          )
        ],
            ),
      ),
    );
  }
}