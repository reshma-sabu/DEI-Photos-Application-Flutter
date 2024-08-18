import 'package:atlantis_di_photos_app/Cart/widget/payment_success_widget.dart';
import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:flutter/material.dart';

class PaymentMethodsOverlay {
  static void show(BuildContext context) {
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          ModalBarrier(
            color: Colors.black.withOpacity(0.3),
            dismissible: false,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Material(
              color: Colors.transparent,
              child: Container(
                // width: 200,
                // height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      DIConstants.SelectMethodText,
                      style: TextStyle(
                          fontSize: 20,
                          color: ConstColors.DIGreen,
                          fontFamily: DIConstants.AvertaDemoPE,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      DIConstants.SelectPaymentMethodSubtext,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6B757F),
                          fontFamily: DIConstants.AvertaDemoPE,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //apple pay button
                    SizedBox(
                      width: DIConstants.getScreenWidth(context) - 40,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFFFFF),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(width: 1, color: Colors.black),
                          ),
                        ),
                        onPressed: () {
                          PaymentSuccessOverlay.show(context);
                        },
                        child: const Text(DIConstants.PayWithButtonText,
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontFamily: DIConstants.AvertaDemoPE,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    //Linked Card button
                    SizedBox(
                      width: DIConstants.getScreenWidth(context) - 40,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0D7B8A),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(DIConstants.LinkedCardButtonText,
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xFFFFFFFF),
                                fontFamily: DIConstants.AvertaDemoPE,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    //New card button
                    SizedBox(
                      width: DIConstants.getScreenWidth(context) - 40,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0D7B8A),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(DIConstants.NewCardButtonText,
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xFFFFFFFF),
                                fontFamily: DIConstants.AvertaDemoPE,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    //Cancel button
                    SizedBox(
                      width: DIConstants.getScreenWidth(context) - 40,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFFFFF),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(
                                width: 1, color: ConstColors.DIGreen),
                          ),
                        ),
                        onPressed: () {
                          overlayEntry?.remove();
                        },
                        child: const Text(DIConstants.CancelText,
                            style: TextStyle(
                                fontSize: 17,
                                color: ConstColors.DIGreen,
                                fontFamily: DIConstants.AvertaDemoPE,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(overlayEntry);
  }
}

class PaymentMethodsWidget extends StatelessWidget {
  const PaymentMethodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overlay Example'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Show Overlay'),
          onPressed: () {
            // Call the overlay using the class
            PaymentMethodsOverlay.show(context);
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PaymentMethodsWidget(),
  ));
}
