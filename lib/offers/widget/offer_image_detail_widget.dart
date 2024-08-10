import 'package:atlantis_di_photos_app/model/image.dart';
import 'package:atlantis_di_photos_app/offers/widget/selected_checkbox_widget.dart';
import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:flutter/material.dart';

class OfferImageDetailWidget extends StatefulWidget {
  final List<ImageM> offerDetails;
  final int index;
  final Function(bool) onImageSelectionChanged;
  final int selectedImageCount;
  final int maxSelectImageCount;

  const OfferImageDetailWidget({
    super.key,
    required this.offerDetails,
    required this.index,
    required this.onImageSelectionChanged,
    required this.selectedImageCount,
    required this.maxSelectImageCount,
  });

  @override
  State<OfferImageDetailWidget> createState() => _OfferImageDetailWidgetState();
}

class _OfferImageDetailWidgetState extends State<OfferImageDetailWidget> {
  bool isChecked = false;

  void _toggleCheckbox() {
    final isSelected = widget.offerDetails[widget.index].isSelected ?? false;

    if (widget.maxSelectImageCount == 0 ||
        (widget.selectedImageCount < widget.maxSelectImageCount)) {
      setState(() {
        widget.offerDetails[widget.index].isSelected =
            !(widget.offerDetails[widget.index].isSelected ?? false);
        widget.onImageSelectionChanged(
            widget.offerDetails[widget.index].isSelected!);
      });
    } else if (widget.offerDetails[widget.index].isSelected == true) {
      setState(() {
        widget.offerDetails[widget.index].isSelected = false;
        widget.onImageSelectionChanged(false);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: ConstColors.DIGreen,
        content: Text(
          'You have reached maximum limit of ${widget.maxSelectImageCount} images.',
          style: const TextStyle(
              color: Colors.white,
              fontFamily: DIConstants.AvertaDemoPE,
              fontSize: 14),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.offerDetails[widget.index].imageUrl,
                  fit: BoxFit.cover,
                  width: 112,
                  height: 112,
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 28,
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                        color: ConstColors.DIGreenOffersTabWithOpacity),
                    child: Image.asset('assets/images/logo.png'),
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8))),
                    height: 28,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Center(
                        child: Row(
                          children: [
                            Text(
                              widget.offerDetails[widget.index].price
                                  .toString(),
                              style: const TextStyle(
                                  fontFamily: DIConstants.AvertaDemoPE,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              widget.offerDetails[widget.index].currency
                                  .toString(),
                              style: const TextStyle(
                                  fontFamily: DIConstants.AvertaDemoPE,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: GestureDetector(
                                  onTap: () {
                                    _toggleCheckbox();
                                  },
                                  child: widget.offerDetails[widget.index]
                                              .isSelected ??
                                          false
                                      ? const SelectedCheckboxWidget()
                                      : Image.asset(
                                          'assets/images/checkbox.png',
                                          width: 18,
                                          height: 18,
                                          fit: BoxFit.fill,
                                        )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
