import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartmetermobile/features/auth/presentation/views/intro/intro_screen.dart';
import 'package:smartmetermobile/features/auth/presentation/views/login/login_view.dart';

import 'error_route_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
      case IntroScreen.routeName:
        return pageRoute(const IntroScreen());

      case LoginView.routeName:
        return pageRoute(const LoginView());

      default:
        return errorRoute();
    }
  }

  static PageRoute pageRoute(Widget page) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: (_) => page);
    }

    return MaterialPageRoute(builder: (_) => page);
  }
}
