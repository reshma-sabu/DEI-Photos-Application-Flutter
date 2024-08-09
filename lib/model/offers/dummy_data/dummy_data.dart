import 'package:atlantis_di_photos_app/model/offers/offersM.dart';
import 'package:atlantis_di_photos_app/model/purchased/purchasedM.dart';

final imagesList = [
  PurchasedM(purchasedDate: "Jun 10", imageDetail: [
    PurchasedImagesDetail(
        isDownloaded: true,
        imageUrl: 'https://picsum.photos/seed/picsum/200/300'),
    PurchasedImagesDetail(
        isDownloaded: false,
        imageUrl: 'https://picsum.photos/seed/picsum/200/300'),
    PurchasedImagesDetail(
        isDownloaded: false,
        imageUrl: 'https://picsum.photos/seed/picsum/200/300'),
  ]),
  // PurchasedM(purchasedDate: "Jun 7", imageDetail: [
  //   PurchasedImagesDetail(
  //       isDownloaded: false, imageUrl: 'assets/images/image2.jpg'),
  //   PurchasedImagesDetail(
  //       isDownloaded: false, imageUrl: 'assets/images/image1.jpg'),
  //   PurchasedImagesDetail(
  //       isDownloaded: false, imageUrl: 'assets/images/image2.jpg'),
  // ]),
  // PurchasedM(purchasedDate: "March 28", imageDetail: [
  //   PurchasedImagesDetail(
  //       isDownloaded: false, imageUrl: 'assets/images/image1.jpg'),
  //   PurchasedImagesDetail(
  //       isDownloaded: false, imageUrl: 'assets/images/image2.jpg'),
  //   PurchasedImagesDetail(
  //       isDownloaded: false, imageUrl: 'assets/images/image1.jpg'),
  // ]),
];

final offerDetailList = [
  OfferDetailM(
    isSelected: false,
    imageUrl:
        'https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
    price: 10.00,
    currency: 'ADE',
    isVideo: false,
  ),
  OfferDetailM(
    isSelected: false,
    imageUrl: 'https://picsum.photos/200/300/?blur',
    price: 04.00,
    currency: 'ADE',
    isVideo: false,
  ),
  OfferDetailM(
    isSelected: false,
    imageUrl: 'https://picsum.photos/200/300.jpg',
    price: 05.00,
    currency: 'ADE',
    isVideo: false,
  ),
  OfferDetailM(
    isSelected: false,
    imageUrl: 'https://picsum.photos/200/300/?blur',
    price: 12.00,
    currency: 'ADE',
    isVideo: false,
  ),
  OfferDetailM(
    isSelected: false,
    imageUrl: 'https://picsum.photos/200/300',
    price: 10.00,
    currency: 'ADE',
    isVideo: false,
  ),
  OfferDetailM(
    isSelected: false,
    imageUrl:
        'https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
    price: 04.00,
    currency: 'ADE',
    isVideo: false,
  ),
  OfferDetailM(
    isSelected: false,
    imageUrl: 'https://picsum.photos/200/300',
    price: 02.00,
    currency: 'ADE',
    isVideo: false,
  ),
  OfferDetailM(
    isSelected: false,
    imageUrl: 'https://picsum.photos/200/300/?blur',
    price: 03.00,
    currency: 'ADE',
    isVideo: false,
  ),
  OfferDetailM(
    isSelected: false,
    imageUrl:
        'https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
    price: 03.00,
    currency: 'ADE',
    isVideo: false,
  ),
  // OfferDetailM(
  //     isSelected: false,
  //     imageUrl: 'assets/images/image1.jpg',
  //     price: 03.00,
  //     currency: 'ADE',
  //     videoUrl: 'assets/video/video1.mp4',
  //     isVideo: true),
  // OfferDetailM(
  //     isSelected: false,
  //     imageUrl: 'assets/images/image1.jpg',
  //     price: 03.00,
  //     currency: 'ADE',
  //     videoUrl: 'assets/video/video2.mp4',
  //     isVideo: true),
];
final offersDropdownList = [
  OfferPriceDetail(
      offerDetail: 'Choose 4 images for 20 AED',
      imageCount: 7,
      amount: '20',
      currency: 'ADE',
      selectedDropdownOption: ''),
  OfferPriceDetail(
      offerDetail: 'Choose 5 images for 30 AED',
      imageCount: 5,
      amount: '30',
      currency: 'ADE',
      selectedDropdownOption: ''),
  OfferPriceDetail(
      offerDetail: 'Choose 20 images for 40 AED',
      imageCount: 20,
      amount: '40',
      currency: 'ADE',
      selectedDropdownOption: ''),
];
