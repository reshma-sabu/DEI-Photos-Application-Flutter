import 'dart:convert';
import 'package:atlantis_di_photos_app/model/purchased/purchasedM.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<PurchasedM>> getPurchasedImages() async {
  final String response = await rootBundle.loadString('assets/purchased_images.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => PurchasedM.fromJson(json)).toList();
}
