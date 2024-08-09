import 'package:flutter/material.dart';

class SelectedCheckboxWidget extends StatelessWidget {
  const SelectedCheckboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Image.asset(
        'assets/images/check.png',
        width: 12,
        height: 8,
      ),
    );
  }
}
