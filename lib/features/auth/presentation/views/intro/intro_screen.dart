import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/constants/constants.dart';
import 'package:smartmetermobile/cores/navigator/navigator.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';
import 'package:smartmetermobile/features/auth/presentation/views/login/login_view.dart';
import 'package:smartmetermobile/features/auth/presentation/views/login/sign_up_view.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = '/intro';

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      bg: kcPrimaryColor,
      useSingleScroll: false,
      usePadding: false,
      topSafeArea: false,
      useBottomPadding: false,
      body: Stack(children: [
        ImageWidget(
          imageTypes: ImageTypes.svg,
          imageUrl: "assets/image/bg_image.svg",
          fit: BoxFit.fill,
          height: sh(110),
          width: sw(100),
        ),
        Align(
          alignment: Alignment.center,
          child: ImageWidget(
            imageTypes: ImageTypes.svg,
            imageUrl: "assets/image/app_logo.svg",
            fit: BoxFit.fill,
            height: h(140),
            width: w(220),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: w(16)),
          alignment: Alignment.bottomCenter,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Button(
              text: "Login",
              onTap: () => AppRouter.instance.navigateTo(LoginView.routeName),
              color: Colors.white,
              textColor: kcPrimaryColor,
            ),
            const VSpace(16),
            Button.withBorderLine(
              text: "Signup",
              textColor: Colors.white,
              onTap: () => AppRouter.instance.navigateTo(SignUpView.routeName),
            ),
            const VSpace(40),
          ]),
        ).animate(delay: 1500.ms).fadeIn(duration: 500.ms)
      ]),
    );
  }
}
