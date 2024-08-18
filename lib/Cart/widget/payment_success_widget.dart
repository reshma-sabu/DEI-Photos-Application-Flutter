import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:flutter/material.dart';

class PaymentSuccessOverlay {
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
                    const SizedBox(height: 20,),
                    Image.asset("assets/images/done icon.png", height: 43, width: 43,),
                    const Center(
                      child: Text(
                        DIConstants.PaymentSuccessText,
                        style: TextStyle(
                            fontSize: 40,
                            color: ConstColors.DIGreen,
                            fontFamily: DIConstants.SkiaFont,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 15,),
                     const Center(
                      child: Text(
                        DIConstants.PaymentSuccessValidityText1,
                        style: TextStyle(
                            fontSize: 20,
                            color: ConstColors.DIGreen,
                            fontFamily: DIConstants.AvertaDemoPE,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Center(
                      child: Text(
                        DIConstants.PaymentSuccessValidityText2,
                        style: TextStyle(
                            fontSize: 20,
                            color: ConstColors.DIGreen,
                            fontFamily: DIConstants.AvertaDemoPE,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 30,),
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
                        child: const Text(DIConstants.ViewPurchasesText,
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xFFFFFFFF),
                                fontFamily: DIConstants.AvertaDemoPE,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: DIConstants.getScreenWidth(context) - 40,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFFFFF),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(width: 1, color: ConstColors.DIGreen),
                            
                          ),
                        ),
                        onPressed: () {
                          overlayEntry?.remove();
                        },
                        child: const Text(DIConstants.CloseText,
                            style: TextStyle(
                                fontSize: 17,
                                color: ConstColors.DIGreen,
                                fontFamily: DIConstants.AvertaDemoPE,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    const SizedBox(height: 15,)
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

class PaymentSuccessWidget extends StatelessWidget {
  const PaymentSuccessWidget({super.key});

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
            PaymentSuccessOverlay.show(context);
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaymentSuccessWidget(),
  ));
}
