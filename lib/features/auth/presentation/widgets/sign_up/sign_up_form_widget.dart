import 'package:flutter/material.dart';
import 'package:smartmetermobile/app/locator.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/navigator/app_router.dart';
import 'package:smartmetermobile/cores/utils/utils.dart';
import 'package:smartmetermobile/features/auth/presentation/cubit/sign_up_cubit.dart';
import 'package:smartmetermobile/features/auth/presentation/views/auth_success_view.dart';

class SignUpFromWidget extends StatelessWidget {
  const SignUpFromWidget({super.key});

  static final SignUpCubit _signUpCubit = getIt<SignUpCubit>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sh(68),
      padding: EdgeInsets.symmetric(horizontal: w(16)).copyWith(
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(sr(16)),
      ),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const VSpace(16),
          TextFieldWidget(
            title: "First name",
            hintText: "",
            onChanged: _signUpCubit.onFirstNameChanged,
          ),
          const VSpace(16),
          TextFieldWidget(
            title: "Last name",
            hintText: "",
            onChanged: _signUpCubit.onFirstNameChanged,
          ),
          const VSpace(16),
          TextFieldWidget(
            title: "Email",
            hintText: "",
            onChanged: _signUpCubit.onEmailChanged,
          ),
          const VSpace(16),
          TextFieldWidget(
            title: "Phone",
            hintText: "",
            onChanged: _signUpCubit.onPhoneChanged,
          ),
          const VSpace(16),
          TextFieldWidget(
            title: "Password",
            hintText: "",
            isPassword: true,
            onChanged: _signUpCubit.onPasswordChanged,
          ),
          const VSpace(16),
          TextFieldWidget(
            title: "Re-enter Password",
            hintText: "",
            isPassword: true,
            onChanged: _signUpCubit.onConfirmPasswordChanged,
          ),
          const VSpace(30),
          Button(
            text: "Signup",
            onTap: () => AppRouter.instance.navigateTo(
              AuthSuccessView.routeName,
            ),
          ),
          const VSpace(),
        ]),
      ),
    );
  }
}
