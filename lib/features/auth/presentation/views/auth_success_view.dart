import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/constants/constants.dart';
import 'package:smartmetermobile/cores/navigator/navigator.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';
import 'package:smartmetermobile/features/auth/presentation/views/login/login_view.dart';

class AuthSuccessView extends StatelessWidget {
  static const String routeName = "/auth_success";
  const AuthSuccessView({
    super.key,
    this.title = "Congratulations!",
    this.subtitle =
        "Your account has been created successfully. \n\nA link has been sent to your email address to verify your account",
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      useSingleScroll: false,
      topSafeArea: false,
      usePadding: false,
      body: Stack(children: [
        ImageWidget(
          imageTypes: ImageTypes.svg,
          imageUrl: "assets/image/bg_image.svg",
          fit: BoxFit.fill,
          height: sh(110),
          width: sw(100),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: w(16)),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(h(16)),
                  topRight: Radius.circular(h(16)),
                )),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const HSpace(double.infinity),
              const VSpace(16),
              SizedBox.square(
                dimension: h(162),
                child: const ImageWidget(
                  imageTypes: ImageTypes.svg,
                  imageUrl: "assets/icon/check.svg",
                ),
              ),
              const VSpace(40),
              TextWidget(
                title,
                style: GoogleFonts.bricolageGrotesque(),
                size: sp(40),
                color: kcPrimaryColor,
              ),
              TextWidget(
                subtitle,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                color: const Color(0xff344054),
              ),
              const VSpace(40),
              Button(
                text: "Proceed to Login",
                onTap: () => AppRouter.instance.clearRouteAndPush(
                  LoginView.routeName,
                ),
              ),
              const VSpace(20),
            ]),
          ),
        ),
      ]),
    );
  }
}
