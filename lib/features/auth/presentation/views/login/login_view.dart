import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';
import 'package:smartmetermobile/features/auth/presentation/widgets/login/login_from_widget.dart';

class LoginView extends StatefulWidget {
  static const String routeName = "/login";
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      useSingleScroll: false,
      topSafeArea: false,
      usePadding: false,
      useBottomPadding: false,
      body: Stack(children: [
        header(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: Transform.translate(
              offset: Offset(0, -h(10)),
              child: const LoginFromWidget(),
            ),
          ),
        ),
      ]),
    );
  }

  Widget header() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        height: sh(60),
        width: sw(100),
        child: Stack(children: [
          ImageWidget(
            imageTypes: ImageTypes.svg,
            imageUrl: "assets/image/bg_image.svg",
            fit: BoxFit.cover,
            height: sh(60),
            width: sw(100),
          ),
          SizedBox(
            height: sh(55),
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
                      "Login",
                      style: GoogleFonts.bricolageGrotesque(),
                      size: sp(40),
                      color: Colors.white,
                    ),
                    const TextWidget(
                      "Enter your details to login to your account",
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
      ),
    );
  }
}
