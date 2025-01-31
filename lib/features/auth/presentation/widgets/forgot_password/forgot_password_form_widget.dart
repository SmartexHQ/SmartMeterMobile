import 'package:flutter/material.dart';
import 'package:smartmetermobile/app/locator.dart';
import 'package:smartmetermobile/cores/components/custom_button.dart';
import 'package:smartmetermobile/cores/components/custom_textfiled.dart';
import 'package:smartmetermobile/cores/navigator/app_router.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';
import 'package:smartmetermobile/features/auth/presentation/cubit/reset_password_cubit.dart';
import 'package:smartmetermobile/features/auth/presentation/views/forgot_password/enter_code_view.dart';

class ForgotPasswordFormWidget extends StatelessWidget {
  const ForgotPasswordFormWidget({super.key});
  static final ResetPasswordCubit _loginCubit = getIt();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sh(26),
      padding: EdgeInsets.symmetric(horizontal: w(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(sr(16)),
          topRight: Radius.circular(sr(16)),
        ),
      ),
      child: Column(children: [
        const VSpace(16),
        TextFieldWidget(
          title: "Email",
          hintText: "",
          onChanged: _loginCubit.onEmailChanged,
        ),
        const VSpace(40),
        Button(
          text: "Reset Password",
          onTap: () => AppRouter.instance.navigateTo(
            EnterCodeForgotPasswordView.routeName,
          ),
        ),
        const VSpace(30),
      ]),
    );
  }
}
