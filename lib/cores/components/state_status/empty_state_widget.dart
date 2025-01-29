import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../components.dart';

class EmptyStateWidget extends StatelessWidget {
  static const String routeName = '/errorStateWidget';

  final String title;
  final String message;
  final VoidCallback? onTap;
  final bool showButton;

  const EmptyStateWidget({
    super.key,
    this.title = "Opps, No Data Found",
    this.message = "No data found, please try again later.",
    this.onTap,
    this.showButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        horizontalSpace(double.infinity),
        verticalSpace(20),
        ImageWidget(
          imageTypes: ImageTypes.svg,
          imageUrl: "assets/images/no_data.svg",
          height: h(150),
          width: w(150),
          fit: BoxFit.fill,
        ),
        verticalSpace(20),
        TextWidget(title, fontSize: sp(20), fontWeight: FontWeight.w600),
        verticalSpace(),
        SizedBox(
          width: sw(75),
          child: TextWidget(
            message,
            fontSize: sp(15),
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
            withOpacity: 0.7,
          ),
        ),
        verticalSpace(25),
        Visibility(
          visible: showButton,
          child: Button(text: "Retry", onTap: onTap ?? () {}),
        ),
        verticalSpace(),
      ],
    );
  }
}
