import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smartmetermobile/app/app.dart';
import 'package:smartmetermobile/app/locator.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (_, __, ___) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  Locator.init();
  runApp(const MyApp());
}
