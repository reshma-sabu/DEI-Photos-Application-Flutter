import 'package:atlantis_di_photos_app/model/offers/dummy_data/dummy_data.dart';
import 'package:atlantis_di_photos_app/model/offers/offersM.dart';
import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:flutter/material.dart';

class DropdownOptionsWidget extends StatefulWidget {
  final Function(String, int, String) onOptionSelected;
  final String selectedOption;
  final String selectedOfferAmount;
  const DropdownOptionsWidget(
      {super.key,
      required this.onOptionSelected,
      required this.selectedOption,
      required this.selectedOfferAmount});

  @override
  State<DropdownOptionsWidget> createState() => _DropdownOptionsWidgetState();
}

class _DropdownOptionsWidgetState extends State<DropdownOptionsWidget> {
  int? selectedDropdownOptionIndex;
  late Future<OfferDetailM> offerDetailData;

  @override
  void initState() {
    super.initState();

    selectedDropdownOptionIndex = offersDropdownList.indexWhere(
      (offer) =>
          'Choose ${offer.imageCount} image for ${offer.amount} ${offer.currency} ' ==
          widget.selectedOption,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ConstColors.DIOfferDropdownBorderGrey,
          width: 1,
        ),
      ),
      width: DIConstants.getScreenWidth(context) - 38,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: offersDropdownList.length,
        itemBuilder: (context, dropdownIndex) {
           bool isFirst = dropdownIndex == 0;
          bool isLast = dropdownIndex == offersDropdownList.length - 1;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: isFirst ? const Radius.circular(8) : Radius.zero,
                topRight: isFirst ? const Radius.circular(8) : Radius.zero,
                bottomLeft: isLast ? const Radius.circular(8) : Radius.zero,
                bottomRight: isLast ? const Radius.circular(8) : Radius.zero,
              ),
              color: selectedDropdownOptionIndex == dropdownIndex
                  ? ConstColors.DIGreenOffersTabWithOpacity
                  : Colors.white,
            ),
            child: ListTile(
              title: Text(
                // offersDropdownList[dropdownIndex].offerDetail,
                'Choose ${offersDropdownList[dropdownIndex].imageCount} image for ${offersDropdownList[dropdownIndex].amount} ${offersDropdownList[dropdownIndex].currency} ',
                style: TextStyle(
                    fontFamily: DIConstants.AvertaDemoPE,
                    fontWeight: selectedDropdownOptionIndex == dropdownIndex
                        ? FontWeight.w600
                        : FontWeight.w400,
                    fontSize: 12,
                    color: ConstColors.DIOfferDropdownTextColor),
              ),
              onTap: () {
                final selectedDpOption =
                    'Choose ${offersDropdownList[dropdownIndex].imageCount} image for ${offersDropdownList[dropdownIndex].amount} ${offersDropdownList[dropdownIndex].currency} ';

                setState(() {
                  selectedDropdownOptionIndex = dropdownIndex;
                  offersDropdownList[dropdownIndex].selectedDropdownOption =
                      selectedDpOption;
                });
                Future.delayed(const Duration(milliseconds: 300), () {
                  widget.onOptionSelected(
                    offersDropdownList[dropdownIndex].selectedDropdownOption =
                        selectedDpOption,
                    offersDropdownList[dropdownIndex].imageCount,
                    offersDropdownList[dropdownIndex].amount +
                        '.00' +
                        " " +
                        offersDropdownList[dropdownIndex].currency,
                  );
                });
              },
            ),
          );
        },
      ),
    );
  }
}
