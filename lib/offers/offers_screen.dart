import 'package:flutter/material.dart';
import 'package:atlantis_di_photos_app/model/offers/dummy_data/dummy_data.dart';
import 'package:atlantis_di_photos_app/offers/widget/dropdown_options_widget.dart';
import 'package:atlantis_di_photos_app/offers/widget/offer_image_detail_widget.dart';
import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  bool isDropdownMenuHidden = true;
  double dropdownTopPosition = 0.0;
  String selectedOption = DIConstants.viewOffers;
  int selectedImagesCount = 0;
  int maxSelectableImages = 0;
  String? amountFromSelectedDropdownOption;
  double totalSum = 0.0;

  void showHideDropdownMenu() {
    setState(() {
      isDropdownMenuHidden = !isDropdownMenuHidden;
    });
  }

  void updateSelectedDropdownOption(
      String option, int maxImages, String amount) {
    setState(() {
      selectedOption = option;
      isDropdownMenuHidden = true;
      maxSelectableImages = maxImages;
      amountFromSelectedDropdownOption = amount;
    });
  }

  void onImageSelectionChanged({isSelected, required imagePrice}) {
    if (maxSelectableImages == 0) {
      setState(() {
        if (isSelected) {
          selectedImagesCount++;
          totalSum += imagePrice;
        } else {
          selectedImagesCount--;
          totalSum -= imagePrice;
        }
      });
    } else {
      setState(() {
        if (isSelected) {
          selectedImagesCount++;
        } else {
          selectedImagesCount--;
        }
      });
    }
  }

  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isDropdownMenuHidden = !isDropdownMenuHidden;
                    });
                  },
                  child: Container(
                    width: DIConstants.getScreenWidth(context) - 38,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: ConstColors.DIOfferDropdownBorderGrey,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            selectedOption,
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: DIConstants.AvertaDemoPE,
                              fontWeight: FontWeight.w400,
                              color: ConstColors.DIOfferDropdownTextColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Image.asset(
                            'assets/images/dropdownIcon.png',
                            width: 10.28,
                            height: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (totalSum > 0 || selectedImagesCount > 0)
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: (ConstColors.DITotalAmountInOffer),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 52.0),
                        child: Text(
                          DIConstants.total,
                          style: TextStyle(
                              fontFamily: DIConstants.AvertaDemoPE,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: ConstColors.DIGreen),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 52.0),
                        child: Text(
                          selectedOption != DIConstants.viewOffers
                              ? (amountFromSelectedDropdownOption ?? '')
                              : totalSum.toStringAsFixed(2),
                          style: const TextStyle(
                              fontFamily: DIConstants.AvertaDemoPE,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: ConstColors.DIGreen),
                        ),
                      )
                    ],
                  ),
                ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Photos',
                  style: TextStyle(
                    color: ConstColors.DIGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: DIConstants.SkiaFont,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  itemCount: offerDetailList.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: DIConstants.getScreenWidth(context) / 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final offerDetail = offerDetailList[index];
                    return SizedBox(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          OfferImageDetailWidget(
                            offerDetails: offerDetailList,
                            index: index,
                            selectedImageCount: selectedImagesCount,
                            maxSelectImageCount: maxSelectableImages,
                            onImageSelectionChanged: (bool isSelected) {
                              onImageSelectionChanged(
                                isSelected: isSelected,
                                imagePrice: offerDetail.price,
                              );
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: GestureDetector(
                  onTap: () {
                    print('add to cart button pressed');
                  },
                  child: Container(
                    height: 46,
                    width: 360,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ConstColors.DIGreen,
                    ),
                    child: const Center(
                      child: Text(
                        DIConstants.addToCart,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: DIConstants.AvertaDemoPE,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
          Positioned(
            top: 62,
            left: 19,
            child: Visibility(
              visible: !isDropdownMenuHidden,
              child: DropdownOptionsWidget(
                onOptionSelected: (option, maxImages, amount) =>
                    updateSelectedDropdownOption(option, maxImages, amount),
                selectedOption: selectedOption,
                selectedOfferAmount: amountFromSelectedDropdownOption ?? '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
