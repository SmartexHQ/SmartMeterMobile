// ignore_for_file: non_constant_identifier_names

// import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Enviroment { staging, production }

class ENV {
  Enviroment _envirmonet = Enviroment.staging;
  Enviroment get enviroment => _envirmonet;

  void setEnviroment(Enviroment enviroment) {
    _envirmonet = enviroment;
  }

  String get apiBaseUrl => "https://api-dev.tipmee.com";
  // (dotenv.env['STAGING_BASE_URL'] ?? "https://api-dev.tipmee.com");
  // String get prodApiBaseUrl => dotenv.env['PROD_BASE_URL'] ?? "";
}
