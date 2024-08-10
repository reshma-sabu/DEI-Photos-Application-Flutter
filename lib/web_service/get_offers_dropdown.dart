import 'dart:convert';
import 'package:atlantis_di_photos_app/model/offers/offersM.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<OfferPriceDetail>> getOffersDropdown() async {
  final String response = await rootBundle.loadString('assets/offers_dropdown.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => OfferPriceDetail.fromJson(json)).toList();
}
