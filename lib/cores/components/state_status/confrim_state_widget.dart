import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../components.dart';

class ConfirmStateWidget extends StatelessWidget {
  static const String routeName = '/errorStateWidget';

  final String title;
  final String message;
  final VoidCallback? onTap;
  final String buttonText;
  final bool isLoading;

  const ConfirmStateWidget({
    super.key,
    this.title = "Confirm",
    this.message = "",
    this.onTap,
    this.buttonText = "Okay",
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        verticalSpace(20),
        ImageWidget(
          width: w(76),
          height: h(76),
          imageTypes: ImageTypes.svg,
          imageUrl: "assets/icons/bills/pending_state.svg",
        ),
        verticalSpace(20),
        TextWidget(
          title,
          fontSize: sp(20),
          fontWeight: FontWeight.w700,
        ),
        verticalSpace(),
        SizedBox(
          width: sw(75),
          child: TextWidget(
            message,
            fontSize: sp(14),
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
        ),
        verticalSpace(25),
        isLoading
            ? const Button.loading()
            : Button(text: buttonText, onTap: onTap ?? () {}),
        verticalSpace(),
      ],
    );
  }
}
