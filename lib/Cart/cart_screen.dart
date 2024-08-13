import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
              title: const Text('Your Cart',
              style: TextStyle(
                fontFamily: DIConstants.SkiaFont,
                fontWeight: FontWeight.w400,
                color: ConstColors.DIGreen
              ),
              ),
        ),
        body: Center(
          child: Text('Cart Screen'),
        ));
  }
}
