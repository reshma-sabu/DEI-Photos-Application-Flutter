import 'dart:io';

import 'package:atlantis_di_photos_app/purchased/purchased_screen.dart';
import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
   HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ConstColors.DIGreen,
        useMaterial3: true,
      ),
      home: const PurchasedScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}