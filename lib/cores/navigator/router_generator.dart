import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartmetermobile/features/auth/presentation/views/auth_success_view.dart';
import 'package:smartmetermobile/features/auth/presentation/views/forgot_password/enter_code_view.dart';
import 'package:smartmetermobile/features/auth/presentation/views/forgot_password/forgot_password_view.dart';
import 'package:smartmetermobile/features/auth/presentation/views/forgot_password/reset_password_view.dart';
import 'package:smartmetermobile/features/auth/presentation/views/intro/intro_screen.dart';
import 'package:smartmetermobile/features/auth/presentation/views/login/login_view.dart';
import 'package:smartmetermobile/features/auth/presentation/views/login/sign_up_view.dart';
import 'package:smartmetermobile/features/home/presentation/view/home_tab_view.dart';

import 'error_route_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
      case IntroScreen.routeName:
        return pageRoute(const IntroScreen());

      case LoginView.routeName:
        return pageRoute(const LoginView());

      case SignUpView.routeName:
        return pageRoute(const SignUpView());

      case AuthSuccessView.routeName:
        return pageRoute(const AuthSuccessView());

      case ForgotPasswordView.routeName:
        return pageRoute(const ForgotPasswordView());

      case EnterCodeForgotPasswordView.routeName:
        return pageRoute(const EnterCodeForgotPasswordView());

      case ResetPasswordView.routeName:
        return pageRoute(const ResetPasswordView());

      case HomeTabView.routeName:
        return pageRoute(const HomeTabView());

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
