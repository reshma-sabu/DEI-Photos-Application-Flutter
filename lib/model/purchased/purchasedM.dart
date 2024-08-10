import 'package:atlantis_di_photos_app/model/image.dart';

class PurchasedM {
  final String purchasedDate;
  final List<ImageM> imageDetail;

  PurchasedM({required this.purchasedDate, required this.imageDetail});

  factory PurchasedM.fromJson(Map<String, dynamic> json) {
    var list = json['imageDetail'] as List;
    List<ImageM> imagesList = list.map((i) => ImageM.fromJson(i)).toList();

    return PurchasedM(
        purchasedDate: json['purchasedDate'], imageDetail: imagesList);
  }

  Map<String, dynamic> toJson() {
    return {
      'purchasedDate': purchasedDate,
      'imageDetail': imageDetail.map((image) => image.toJson()).toList(),
    };
  }
}

class PurchasedImagesDetail {
  final String? imageUrl;
  bool isDownloaded;

  PurchasedImagesDetail({this.imageUrl, required this.isDownloaded});
}
