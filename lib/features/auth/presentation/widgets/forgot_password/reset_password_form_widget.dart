import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/custom_button.dart';
import 'package:smartmetermobile/cores/components/custom_textfiled.dart';
import 'package:smartmetermobile/cores/navigator/app_router.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';
import 'package:smartmetermobile/features/auth/presentation/views/auth_success_view.dart';

class ResetPasswordFormWidget extends StatelessWidget {
  const ResetPasswordFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sh(36),
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
          title: "New password",
          hintText: "",
          isPassword: true,
          onChanged: (_) {},
        ),
        const VSpace(16),
        TextFieldWidget(
          title: "Re-enter password",
          hintText: "",
          isPassword: true,
          onChanged: (_) {},
        ),
        const VSpace(40),
        Button(
          text: "Reset Password",
          onTap: () => AppRouter.instance.navigate(
            const AuthSuccessView(
              subtitle: "Your password was changed successfully.",
            ),
          ),
        ),
        const VSpace(30),
      ]),
    );
  }
}
