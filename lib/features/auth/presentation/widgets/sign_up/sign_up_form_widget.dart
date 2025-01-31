import 'package:flutter/material.dart';
import 'package:smartmetermobile/app/locator.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/utils/utils.dart';
import 'package:smartmetermobile/features/auth/presentation/cubit/login_cubit.dart';

class SignUpFromWidget extends StatelessWidget {
  const SignUpFromWidget({super.key});

  static final LoginCubit _loginCubit = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sh(68),
      padding: EdgeInsets.symmetric(horizontal: w(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(sr(16)),
      ),
      child: Column(children: [
        const VSpace(16),
        TextFieldWidget(
          title: "Email",
          hintText: "",
          onChanged: _loginCubit.onEmailChanged,
        ),
        const VSpace(16),
        TextFieldWidget(
          title: "Password",
          hintText: "",
          isPassword: true,
          onChanged: _loginCubit.onPasswordChanged,
        ),
        const VSpace(16),
        const Align(
          alignment: Alignment.centerRight,
          child: TextWidget.semibold(
            "Forgot Password?",
            color: Color(0xff1570EF),
            size: 14,
          ),
        ),
        const VSpace(40),
        Button(text: "Login", onTap: () {}),
        const VSpace(30),
        const TextWidget.semibold(
          "Don’t have an account? Signup",
          color: Color(0xff1570EF),
          size: 14,
        ),
      ]),
    );
  }
}
