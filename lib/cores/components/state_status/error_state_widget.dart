import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/navigator/app_router.dart';

import '../../utils/utils.dart';
import '../components.dart';

class ErrorStateWidget extends StatelessWidget {
  static const String routeName = '/errorStateWidget';

  final String title;
  final String message;
  final VoidCallback? onTap;

  const ErrorStateWidget({
    super.key,
    this.title = "Failure",
    this.message = "Something went wrong, Please try again",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      verticalSpace(20),
      TextWidget(
        title,
        size: sp(20),
        fontWeight: FontWeight.w700,
      ),
      verticalSpace(),
      SizedBox(
        width: sw(75),
        child: TextWidget(
          message,
          size: sp(14),
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
      ),
      verticalSpace(25),
      Button(text: "Retry", onTap: onTap ?? AppRouter.instance.goBack),
      verticalSpace(),
    ]);
  }
}
