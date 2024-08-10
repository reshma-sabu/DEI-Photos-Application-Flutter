import 'dart:convert';
import 'package:atlantis_di_photos_app/model/image.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<ImageM>> loadOfferDetailData() async {
  final String response = await rootBundle.loadString('assets/offers_data.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => ImageM.fromJson(json)).toList();
}
