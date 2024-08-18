import 'package:flutter/material.dart';

class DIConstants {
  static const String SkiaFont = "SkiaFont";
  static const String PurchasedValidity =
      "Please download images within 15 days.";
  static const String AvertaDemoPE = "AvertaDemoPEFont";
  static const String imageSavedMsg = "Photo saved to gallery";
  static const String amount = "10.00 ADE";
  static const String addToCart = "ADD TO CART";
  static double getScreenWidth(context) {
    return MediaQuery.of(context).size.width;
  }
  static const String viewOffers = "View Offers";
  static const String total = 'Total:';
  static const String imageSaveCancelledMessage = 'Image save cancelled';
  static const String imageSaveFailedMessage = 'Failed to download image';
  static const String purchaseAll = 'PURCHASE ALL';
  static const String SubTotalText = 'Sub Total';
  static const String DiscountText = 'Discount';
  static const String TotalText = 'Total';
  static const String NoPurchasedPhotosText = 'You have not purchased any photos yet!';
  static const String PaymentSuccessText = 'Success !';
  static const String ViewPurchasesText = 'VIEW PURCHASES';
  static const String CloseText = 'Close';
  static const String PaymentSuccessValidityText1 = 'Please download image within';
  static const String PaymentSuccessValidityText2 = '15 days';


}
