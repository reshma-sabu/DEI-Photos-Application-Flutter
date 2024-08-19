import 'dart:convert';
import 'package:atlantis_di_photos_app/model/image.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<ImageM>> getCartDetails() async {
  final String response = await rootBundle.loadString('assets/cart_details.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => ImageM.fromJson(json)).toList();
}
