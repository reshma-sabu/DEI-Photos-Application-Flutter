import 'package:atlantis_di_photos_app/offers/offers_screen.dart';
import 'package:atlantis_di_photos_app/store/screens/store_screen.dart';
import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'widget/download_image_widget.dart';

class PurchasedTabScreen extends StatelessWidget {
  const PurchasedTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    dividerHeight: 0,
                    indicatorColor: ConstColors.DIGreen,
                    labelColor: ConstColors.DIGreen,
                    unselectedLabelColor: ConstColors.DIBGrey,
                    labelStyle: TextStyle(fontWeight: FontWeight.w600),
                    labelPadding: EdgeInsets.symmetric(
                        horizontal: 12.0), // Reduce horizontal padding
                    indicatorPadding: EdgeInsetsDirectional.only(bottom: 10),

                    tabs: [
                      Tab(
                        child: Align(
                          child: Text(
                            "Store",
                            style: TextStyle(
                              fontFamily: DIConstants.AvertaDemoPE,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      // Tab(
                      //   child: Align(
                      //     child: Text(
                      //       "Offers",
                      //       style: TextStyle(
                      //           fontFamily: DIConstants.AvertaDemoPE,
                      //           fontWeight: FontWeight.w400),
                      //     ),
                      //   ),
                      // ),
                      Tab(
                        child: Align(
                          child: Text(
                            "Purchased",
                            style: TextStyle(
                                fontFamily: DIConstants.AvertaDemoPE,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: TabBarView(
              children: [
                StoreScreen(),
                DownloadImageWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
