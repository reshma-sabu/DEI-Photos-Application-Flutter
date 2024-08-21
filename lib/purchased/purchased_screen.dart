import 'package:atlantis_di_photos_app/Cart/screens/cart_screen.dart';
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
          icon: Image.asset(
            'assets/images/backButton.png',
            height: 19,
            width: 10.24,
          ),
        ),
        title: const Center(
          child: Text(
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Image.asset(
                'assets/images/cartItemIcon.png',
                height: 21.21,
                width: 24,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: const PurchasedTabScreen(),
    );
  }
}
