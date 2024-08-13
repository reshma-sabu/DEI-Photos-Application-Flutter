import 'dart:io';
import 'dart:math';
import 'package:atlantis_di_photos_app/model/purchased/purchasedM.dart';
import 'package:atlantis_di_photos_app/previewImage/preview_purchased_image.dart';
import 'package:atlantis_di_photos_app/purchased/widget/image_downloaded_bottom_toast_widget.dart';
import 'package:atlantis_di_photos_app/utils/constants.dart';
import 'package:atlantis_di_photos_app/web_service/get_purchased_details.dart';
import 'package:flutter/material.dart';
import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class DownloadImageWidget extends StatefulWidget {
  const DownloadImageWidget({super.key});

  @override
  State<DownloadImageWidget> createState() => _DownloadImageWidgetState();
}

class _DownloadImageWidgetState extends State<DownloadImageWidget> {
  late Future<List<PurchasedM>> _purchasedImageFuture;

  @override
  void initState() {
    super.initState();
    _purchasedImageFuture = getPurchasedImages();
  }

  Future<void> _downloadPurchasedImage(
      int sectionIndex, int index, String _url) async {
    var random = Random();
    String message = '';

    try {
      final http.Response response = await http.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        final dir = await getTemporaryDirectory();
        var filename = '${dir.path}/SaveImage${random.nextInt(100)}.png';
        final file = File(filename);
        await file.writeAsBytes(response.bodyBytes);

        final params = SaveFileDialogParams(sourceFilePath: file.path);
        final finalPath = await FlutterFileDialog.saveFile(params: params);

        if (finalPath != null) {
          setState(() {
            _updateDownloadedStatus(context, sectionIndex, index, true);
          });
          _showToast(DIConstants.imageSavedMsg);
        } else {
          setState(() {
            _updateDownloadedStatus(context, sectionIndex, index, false);
          });
          _showToast(DIConstants.imageSaveCancelledMessage);
        }
      } else {
        setState(() {
          _updateDownloadedStatus(context, sectionIndex, index, false);
        });
        _showToast(DIConstants.imageSaveFailedMessage);
      }
    } catch (e) {
      message = 'Error: ${e.toString()}';
      setState(() {
        _updateDownloadedStatus(context, sectionIndex, index, false);
      });
      _showToast(message);
    }
  }

  void _updateDownloadedStatus(
      BuildContext context, int sectionIndex, int index, bool isDownloaded) {
    setState(() {
      _purchasedImageFuture.then((list) {
        if (list.isNotEmpty) {
          list[sectionIndex].imageDetail[index].isDownloaded = isDownloaded;
        }
      });
    });
  }

  void _showToast(String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: ImageDownloadedBottomToastWidget(
            message: message,
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  void _navigateToAnotherScreen(BuildContext context, String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewPurchasedImage(image: imageUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<List<PurchasedM>>(
            future: _purchasedImageFuture,
            builder: (BuildContext context,
                AsyncSnapshot<List<PurchasedM>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No data available'));
              } else {
                final purchasedImageList = snapshot.data!;
                return ListView.builder(
                  itemCount: purchasedImageList.length,
                  itemBuilder: (context, sectionIndex) {
                    final isFirstItem = sectionIndex == 0;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              5, isFirstItem ? 10 : 30, 10, 8),
                          child: Text(
                            purchasedImageList[sectionIndex].purchasedDate,
                            style: const TextStyle(
                                fontSize: 20,
                                color: ConstColors.DIGreen,
                                fontWeight: FontWeight.w400,
                                fontFamily: DIConstants.AvertaDemoPE),
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: purchasedImageList[sectionIndex]
                              .imageDetail
                              .length,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                // Max extent of each cell
                                screenWidth / 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            // Ensure square cells
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (context, index) {
                            final data = purchasedImageList[sectionIndex]
                                .imageDetail[index];
                            return SizedBox(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: data.isDownloaded ?? false
                                        ? () => _navigateToAnotherScreen(
                                            context, data.imageUrl)
                                        : null,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        data.imageUrl,
                                        fit: BoxFit.cover,
                                        width: 112,
                                        height: 112,
                                      ),
                                    ),
                                  ),
                                  if (data.isDownloaded != null &&
                                      !data.isDownloaded!)
                                    GestureDetector(
                                      onTap: () {
                                        _downloadPurchasedImage(
                                            sectionIndex, index, data.imageUrl);
                                      },
                                      child: Image.asset(
                                        'assets/images/downloadIcon.png',
                                        height: 50,
                                        width: 50,
                                      ),
                                    )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            }));
  }
}
