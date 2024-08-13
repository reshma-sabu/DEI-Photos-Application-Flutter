import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ImageDownloadedBottomToastWidget extends StatefulWidget {
  final String message;
  const ImageDownloadedBottomToastWidget({super.key, required this.message});

  @override
  State<ImageDownloadedBottomToastWidget> createState() =>
      _ImageDownloadedBottomToastWidgetState();
}

class _ImageDownloadedBottomToastWidgetState
    extends State<ImageDownloadedBottomToastWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73,
      width: double.infinity,
      color: ConstColors.DISnackbarYellow,
      child: Padding(
        padding: const EdgeInsets.only(left: 42, right: 20),
        child: Row(
          children: [
            Text(
              widget.message,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: DIConstants.AvertaDemoPE,
                  color: ConstColors.DIWhite),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                'assets/images/saveImage.png',
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
