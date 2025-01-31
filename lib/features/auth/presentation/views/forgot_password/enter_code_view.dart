import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/constants/constants.dart';
import 'package:smartmetermobile/cores/navigator/navigator.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';
import 'package:smartmetermobile/features/auth/presentation/views/forgot_password/reset_password_view.dart';

class EnterCodeForgotPasswordView extends StatelessWidget {
  static const String routeName = "/enter-code-forgot-password";
  const EnterCodeForgotPasswordView({super.key});

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
              ),
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const HSpace(double.infinity),
              const VSpace(40),
              TextWidget(
                "Check your email",
                style: GoogleFonts.bricolageGrotesque(),
                size: sp(40),
                color: kcPrimaryColor,
              ),
              const TextWidget(
                "A password recovery code has been sent to your email address.",
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                color: Color(0xff344054),
              ),
              const VSpace(16),
              PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(sr(18)),
                  fieldHeight: 56,
                  fieldWidth: 80,
                  activeFillColor: Colors.white,
                  inactiveColor: const Color(0xffD0D5DD),
                  activeColor: kcPrimaryColor,
                  inactiveFillColor: Colors.transparent,
                  selectedFillColor: Colors.transparent,
                  selectedBorderWidth: 1,
                  activeBorderWidth: 1,
                  inactiveBorderWidth: 1,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {},
                onChanged: (value) {},
                keyboardType: TextInputType.number,
              ),
              const VSpace(16),
              const TextWidget(
                "Didn’t receive an email?",
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                color: Color(0xff344054),
              ),
              const VSpace(16),
              const TextWidget.semibold(
                "Resend in 50s",
                textAlign: TextAlign.center,
                color: kcPrimaryColor,
              ),
              const VSpace(40),
              Button(
                text: "Veriy",
                onTap: () => AppRouter.instance.clearRouteAndPush(
                  ResetPasswordView.routeName,
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
