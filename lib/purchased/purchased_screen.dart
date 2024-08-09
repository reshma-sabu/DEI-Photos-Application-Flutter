import 'package:atlantis_di_photos_app/purchased/purchased_tab_screen.dart';
import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:flutter/material.dart';

class PurchasedScreen extends StatelessWidget {
  const PurchasedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: ConstColors.DIGreen,
              )),
          title: const Text(
            'Photo Booth',
            style: TextStyle(
              color: ConstColors.DIGreen,
              fontFamily: DIConstants.SkiaFont,
              fontSize: 20,
              //figma weight is 400
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: 
            const PurchasedTabScreen(),
          
        );
  }
}
