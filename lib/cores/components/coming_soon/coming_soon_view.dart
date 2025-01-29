import 'package:flutter/material.dart';

import '../../navigator/navigator.dart';
import '../../utils/utils.dart';
import '../components.dart';

class ComingSoonPage extends StatelessWidget {
  static const String routeName = "coming_soon";

  const ComingSoonPage({
    super.key,
    this.showButton = true,
    this.message = 'This Recon feature is \ncoming soon!',
  });

  final bool showButton;
  final String message;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          horizontalSpace(double.infinity),
          Container(
            color: Colors.grey.shade100,
            child: ImageWidget(
              imageUrl: "assets/images/intro/jumping.png",
              imageTypes: ImageTypes.asset,
              height: h(212),
              width: w(270),
            ),
          ),
          verticalSpace(),
          TextWidget(
            message,
            fontSize: sp(24),
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          verticalSpace(20),
          Visibility(
            visible: showButton,
            child: Button(
              text: "Okay",
              onTap: AppRouter.instance.goBack,
            ),
          ),
        ],
      ),
    );
  }
}
