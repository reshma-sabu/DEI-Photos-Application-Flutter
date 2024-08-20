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
        icon: Image.asset(
          'assets/images/backButton.png',
          height: 19,
          width: 10.24,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: const Column(
        children: [
          Text(
            'Your Cart',
            style: TextStyle(
                fontFamily: DIConstants.SkiaFont,
                fontWeight: FontWeight.w600,
                color: ConstColors.DIGreen,
                fontSize: 28),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
