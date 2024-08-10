class ImageM {
  bool? isSelected;
  final String imageUrl;
  final double? price;
  final String? currency;
  final String? videoThumbnail;
  final String? videoUrl;
  final bool? isVideo;
   bool? isDownloaded;

  ImageM({
     this.isSelected,
    required this.imageUrl,
     this.price,
     this.currency,
    this.videoThumbnail,
    this.videoUrl,
     this.isVideo,
    this.isDownloaded,
  });

  factory ImageM.fromJson(Map<String, dynamic> json) {
    return ImageM(
      imageUrl: json['imageUrl'],
      isSelected: json['isSelected'],
      price: json['price'],
      currency: json['currency'],
      videoThumbnail: json['videoThumbnail'],
      videoUrl: json['videoUrl'],
      isVideo: json['isVideo'],
      isDownloaded: json['isDownloaded'],
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'isSelected': isSelected,
      'imageUrl': imageUrl,
      'price': price,
      'currency': currency,
      'videoThumbnail': videoThumbnail,
      'videoUrl': videoUrl,
      'isVideo': isVideo,
      'isDownloaded': isDownloaded,
    };
  }
}