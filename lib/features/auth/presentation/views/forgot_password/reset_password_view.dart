import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartmetermobile/cores/components/app_bar_widget.dart';
import 'package:smartmetermobile/cores/components/custom_scaffold_widget.dart';
import 'package:smartmetermobile/cores/components/custom_text_widget.dart';
import 'package:smartmetermobile/cores/components/image_widget.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';
import 'package:smartmetermobile/features/auth/presentation/widgets/forgot_password/reset_password_form_widget.dart';

class ResetPasswordView extends StatelessWidget {
  static const String routeName = "/reset-password";
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      useSingleScroll: false,
      topSafeArea: false,
      usePadding: false,
      useBottomPadding: false,
      body: Stack(children: [
        header(),
        const Align(
          alignment: Alignment.bottomCenter,
          child: ResetPasswordFormWidget(),
        ),
      ]),
    );
  }

  Widget header() {
    return SizedBox(
      height: sh(62),
      width: sw(100),
      child: Stack(children: [
        ImageWidget(
          imageTypes: ImageTypes.svg,
          imageUrl: "assets/image/bg_image.svg",
          fit: BoxFit.cover,
          height: sh(62),
          width: sw(100),
        ),
        SizedBox(
          height: sh(70),
          width: sw(100),
          child: Column(children: [
            CustomAppBar(backColor: const Color(0xffFCFCFD).withOpacity(0.1)),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    "Reset password",
                    style: GoogleFonts.bricolageGrotesque(),
                    size: sp(40),
                    color: Colors.white,
                  ),
                  const TextWidget(
                    "Try to use a password you’ll remember",
                    color: Color(0xffFCFCFD),
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                  const Row(children: [])
                ],
              ),
            ),
            const VSpace(30),
          ]),
        ),
      ]),
    );
  }
}
