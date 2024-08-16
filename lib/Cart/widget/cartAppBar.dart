import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      // backgroundColor: const Color(0xFFFFFFFF),
      leading: IconButton(
        icon: Image.asset('assets/images/backButton.png', height: 19, width: 10.24,),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
      title: const Column(
        children: [
          Text(
            'Your Cart',
            style: TextStyle(
                fontFamily: DIConstants.SkiaFont,
                fontWeight: FontWeight.w400,
                color: ConstColors.DIGreen,
                fontSize: 28),
          ),
          SizedBox(height: 6),
          Text(
            DIConstants.PurchasedValidity,
            style: TextStyle(
                fontFamily: DIConstants.AvertaDemoPE,
                fontWeight: FontWeight.w400,
                color: ConstColors.DIGreen,
                fontSize: 12),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20);
}
