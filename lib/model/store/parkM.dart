// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:atlantis_di_photos_app/model/image.dart';
import 'package:atlantis_di_photos_app/model/offers/offersM.dart';

List<ParkM> parkFromJson(String str) => List<ParkM>.from(json.decode(str).map((x) => ParkM.fromJson(x)));

String parkToJson(List<ParkM> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ParkM {
    String parkId;
    String parkName;
    int? selectedImageCount;
    List<ImageM> images;
    List<OfferPriceDetail> offers;

    ParkM({
        required this.parkId,
        required this.parkName,
        this.selectedImageCount,
        required this.images,
        required this.offers,
    });

    factory ParkM.fromJson(Map<String, dynamic> json) => ParkM(
        parkId: json["ParkId"],
        parkName: json["parkName"],
        selectedImageCount: json["selectedImageCount"],
        images: List<ImageM>.from(json["images"].map((x) => ImageM.fromJson(x))),
        offers: List<OfferPriceDetail>.from(json["offers"].map((x) => OfferPriceDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ParkId": parkId,
        "parkName": parkName,
        "selectedImageCount": selectedImageCount,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
    };
}
