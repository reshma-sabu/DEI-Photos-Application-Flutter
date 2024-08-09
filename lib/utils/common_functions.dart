import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future<void> shareImageFromAssets({
  required String assetPath,
  required String fileName,
  String? text,
}) async {
  try {
    final ByteData bytes = await rootBundle.load(assetPath);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/$fileName').create();

    await file.writeAsBytes(list);

    await Share.shareXFiles([XFile(file.path)], );
  } catch (e) {
    print('Error sharing image: $e');
  }
}
