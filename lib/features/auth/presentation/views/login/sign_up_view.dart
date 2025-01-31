import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';
import 'package:smartmetermobile/features/auth/presentation/widgets/login/login_from_widget.dart';
import 'package:smartmetermobile/features/auth/presentation/widgets/sign_up/sign_up_form_widget.dart';

class SignUpView extends StatefulWidget {
  static const String routeName = "/signup";
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      useSingleScroll: false,
      topSafeArea: false,
      usePadding: false,
      useBottomPadding: false,
      body: Column(children: [
        header(),
        Transform.translate(
          offset: Offset(0, -h(10)),
          child: const SignUpFromWidget(),
        ),
      ]),
    );
  }

  Widget header() {
    return SizedBox(
      height: sh(32),
      width: sw(100),
      child: Stack(children: [
        ImageWidget(
          imageTypes: ImageTypes.svg,
          imageUrl: "assets/image/bg_image.svg",
          fit: BoxFit.cover,
          height: sh(32),
          width: sw(100),
        ),
        SizedBox(
          height: sh(32),
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
                    "Signup",
                    style: GoogleFonts.bricolageGrotesque(),
                    size: sp(40),
                    color: Colors.white,
                  ),
                  const TextWidget(
                    "Create a new account to access amazing benefits",
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
