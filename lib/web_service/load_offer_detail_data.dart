import 'dart:convert';
import 'package:atlantis_di_photos_app/model/offers/offersM.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<OfferDetailM>> loadOfferDetailData() async {
  final String response = await rootBundle.loadString('assets/dummy_data.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => OfferDetailM.fromJson(json)).toList();
}
