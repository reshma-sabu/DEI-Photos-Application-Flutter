import 'package:atlantis_di_photos_app/Cart/widget/cartAppBar.dart';
import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final List<Map<String, dynamic>> cartItems = [
    {
      'image': 'https://picsum.photos/200',
      'price': '10.00 AED',
      'date': '2024-06-28 | 12:30 PM'
    },
    {
      'image': 'https://picsum.photos/200',
      'price': '02.00 AED',
      'date': '2024-05-01 | 10:30 AM'
    },
    {
      'image': 'https://picsum.photos/200',
      'price': '04.00 AED',
      'date': '2024-05-01 | 11:20 AM'
    },
    {
      'image': 'https://picsum.photos/200',
      'price': '30.00 AED',
      'date': '2024-05-01 | 11:20 AM'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CartAppBar(),
      body: Column(
        children: [
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
                      padding: const EdgeInsets.only(left: 10.0, top: 8, bottom: 8, right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 112,
                            height: 112,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(item['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                              width: 16), // Add spacing between image and text

                          // Column for price and date, center aligned
                          Expanded(
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center, // Center vertically
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Align text to the start (left)
                              children: [
                                Text(
                                  item['price'],
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: DIConstants.AvertaDemoPE,
                                    color: ConstColors.DIGreen,
                                  ),
                                ),
                                const SizedBox(
                                    height:
                                        8), // Add space between price and date
                                Text(
                                  item['date'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: DIConstants.AvertaDemoPE,
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
                                print("delete");
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
                    const Divider(
                      thickness: 1,
                      color: Color(0xFFECECEC),
                    ), // Divider for each row
                  ],
                );
              },
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              height: 140,
              color: const Color(0xFFE0F5FA),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(DIConstants.SubTotalText,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: DIConstants.AvertaDemoPE,
                                fontWeight: FontWeight.w700,
                                color: ConstColors.DIBGrey)),
                        Text("46.00 AED",
                            style: TextStyle(
                                fontSize: 20,
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
                                fontSize: 20,
                                fontFamily: DIConstants.AvertaDemoPE,
                                fontWeight: FontWeight.w700,
                                color: ConstColors.DIBGrey)),
                        Text("20.00 AED",
                            style: TextStyle(
                                fontSize: 20,
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
                                fontSize: 20,
                                fontFamily: DIConstants.AvertaDemoPE,
                                fontWeight: FontWeight.w700,
                                color: ConstColors.DIBGrey)),
                        Text("26.00 AED",
                            style: TextStyle(
                                fontSize: 20,
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D7B8A),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {},
                child: const Text(DIConstants.purchaseAll,
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFFFFFFF),
                        fontFamily: DIConstants.AvertaDemoPE,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
