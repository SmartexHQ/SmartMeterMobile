import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../components.dart';

class SuccessStateWidget extends StatelessWidget {
  static const String routeName = '/successStateWidget';

  final String title;
  final String message;
  final VoidCallback? onTap;

  const SuccessStateWidget({
    super.key,
    this.title = "Success",
    this.message = "Operation was successful",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const VSpace(20),
        ImageWidget(
          width: w(76),
          height: h(76),
          imageTypes: ImageTypes.svg,
          imageUrl: "assets/svg/check.svg",
        ),
        const VSpace(20),
        TextWidget(
          title,
          size: sp(20),
          fontWeight: FontWeight.w700,
        ),
        const VSpace(),
        SizedBox(
          width: sw(75),
          child: TextWidget(
            message,
            size: sp(14),
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
        ),
        const VSpace(25),
        Button(text: "Done", onTap: onTap ?? () {}),
        const VSpace(),
      ],
    );
  }
}
