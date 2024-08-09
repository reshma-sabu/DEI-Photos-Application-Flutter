class PurchasedM {
  final String purchasedDate;
  final List<PurchasedImagesDetail> imageDetail;

  PurchasedM({required this.purchasedDate, required this.imageDetail});
}

class PurchasedImagesDetail {
  final String? imageUrl;
  bool isDownloaded;

  PurchasedImagesDetail({this.imageUrl, required this.isDownloaded});
}