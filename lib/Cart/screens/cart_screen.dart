import 'package:atlantis_di_photos_app/Cart/widget/cartAppBar.dart';
import 'package:atlantis_di_photos_app/Cart/widget/payment_methods_widget.dart';
import 'package:atlantis_di_photos_app/Cart/widget/payment_success_widget.dart';
import 'package:atlantis_di_photos_app/model/image.dart';
import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:atlantis_di_photos_app/web_service/get_cart_details.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Future<List<ImageM>> _imageDetailFuture;

  @override
  void initState() {
    super.initState();
    _imageDetailFuture = getCartDetails();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = screenWidth * 0.25;
    final fontSizeTitle = screenWidth * 0.05;
    final fontSizeSubtitle = screenWidth * 0.03;
    print("imageSize $imageSize");
    print("fontSizeTitle $fontSizeTitle");

    print("fontSizeSubtitle $fontSizeSubtitle");

    return FutureBuilder<List<ImageM>>(
        future: _imageDetailFuture,
        builder: (BuildContext context, AsyncSnapshot<List<ImageM>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final cartItems = snapshot.data!;
            return Scaffold(
              appBar: const CartAppBar(),
              body: Column(
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        DIConstants.PurchasedValidity,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: DIConstants.AvertaDemoPE,
                          color: ConstColors.DIGreen,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return Column(
                          children: [
                            if (index == 0)
                              const Divider(
                                thickness: 1,
                                color: Color(0xFFECECEC),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, top: 8, bottom: 8, right: 18),
                              child: Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //image
                                  Container(
                                    width: imageSize,
                                    height: imageSize,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(item.imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  // Column for price and date
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //price
                                        Text(
                                          "${item.price} ${item.currency}",
                                          style: TextStyle(
                                            fontSize: fontSizeTitle,
                                            fontWeight: FontWeight.w700,
                                            fontFamily:
                                                DIConstants.AvertaDemoPE,
                                            color: ConstColors.DIGreen,
                                          ),
                                        ),
                                        // const SizedBox(height: 8),
                                        //date and time
                                        Text(
                                          item.dateAndTime ?? "",
                                          style: TextStyle(
                                            fontSize: fontSizeSubtitle,
                                            fontFamily:
                                                DIConstants.AvertaDemoPE,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF757575),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        print("delete ${item.id}");
                                      },
                                      child: Image.asset(
                                        'assets/images/delete.png',
                                        width: 19.2,
                                        height: 28,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Divider for each row
                            const Divider(
                              thickness: 1,
                              color: Color(0xFFECECEC),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      // height: 140,
                      color: const Color(0xFFE0F5FA),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(DIConstants.SubTotalText,
                                    style: TextStyle(
                                        fontSize: fontSizeTitle,
                                        fontFamily: DIConstants.AvertaDemoPE,
                                        fontWeight: FontWeight.w700,
                                        color: ConstColors.DIBGrey)),
                                Text("46.00 AED",
                                    style: TextStyle(
                                        fontSize: fontSizeTitle,
                                        fontFamily: DIConstants.AvertaDemoPE,
                                        fontWeight: FontWeight.w700,
                                        color: ConstColors.DIGreen)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(DIConstants.DiscountText,
                                    style: TextStyle(
                                        fontSize: fontSizeTitle,
                                        fontFamily: DIConstants.AvertaDemoPE,
                                        fontWeight: FontWeight.w700,
                                        color: ConstColors.DIBGrey)),
                                Text("20.00 AED",
                                    style: TextStyle(
                                        fontSize: fontSizeTitle,
                                        fontFamily: DIConstants.AvertaDemoPE,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFFF5959))),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(DIConstants.TotalText,
                                    style: TextStyle(
                                        fontSize: fontSizeTitle,
                                        fontFamily: DIConstants.AvertaDemoPE,
                                        fontWeight: FontWeight.w700,
                                        color: ConstColors.DIBGrey)),
                                Text("26.00 AED",
                                    style: TextStyle(
                                        fontSize: fontSizeTitle,
                                        fontFamily: DIConstants.AvertaDemoPE,
                                        fontWeight: FontWeight.w700,
                                        color: ConstColors.DIGreen)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0D7B8A),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {
                          PaymentMethodsOverlay.show(context);
                        },
                        child: const Text(DIConstants.purchaseAll,
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFFFFFFF),
                                fontFamily: DIConstants.AvertaDemoPE,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
