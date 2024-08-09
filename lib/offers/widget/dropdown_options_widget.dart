import 'package:atlantis_di_photos_app/model/offers/dummy_data/dummy_data.dart';
import 'package:atlantis_di_photos_app/model/offers/offersM.dart';
import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:flutter/material.dart';

class DropdownOptionsWidget extends StatefulWidget {
  final Function(String, int) onOptionSelected;
  const DropdownOptionsWidget({super.key, required this.onOptionSelected});

  @override
  State<DropdownOptionsWidget> createState() => _DropdownOptionsWidgetState();
}

class _DropdownOptionsWidgetState extends State<DropdownOptionsWidget> {
  int? selectedDropdownOptionIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
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
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
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
                setState(() {
                  selectedDropdownOptionIndex = dropdownIndex;
                });
                Future.delayed(const Duration(milliseconds: 300), () {
                  widget.onOptionSelected(
                      'Choose ${offersDropdownList[dropdownIndex].imageCount} image for ${offersDropdownList[dropdownIndex].amount} ${offersDropdownList[dropdownIndex].currency} ',
                      offersDropdownList[dropdownIndex].imageCount);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
