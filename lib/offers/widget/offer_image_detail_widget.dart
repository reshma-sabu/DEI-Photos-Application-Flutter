import 'package:atlantis_di_photos_app/model/offers/offersM.dart';
import 'package:atlantis_di_photos_app/offers/preview_video_screen.dart';
import 'package:atlantis_di_photos_app/offers/widget/selected_checkbox_widget.dart';
import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:flutter/material.dart';

class OfferImageDetailWidget extends StatefulWidget {
  final List<OfferDetailM> offerDetails;
  final int index;
  final VoidCallback onImageTap; 

  const OfferImageDetailWidget(
      {super.key, required this.offerDetails, required this.index, required this.onImageTap});

  @override
  State<OfferImageDetailWidget> createState() => _OfferImageDetailWidgetState();
}

class _OfferImageDetailWidgetState extends State<OfferImageDetailWidget> {
  bool isChecked = false;

  void _toggleCheckbox() {
    setState(() {
      isChecked = !isChecked;
    });
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
              widget.offerDetails[widget.index].isVideo
                  ? const Icon(
                      Icons.play_circle_fill,
                      color: ConstColors.DIGreen,
                      size: 35,
                    )
                  : Positioned(
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
                                  child: isChecked
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
