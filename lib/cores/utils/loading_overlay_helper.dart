import 'package:flutter/material.dart';

import '../components/components.dart';
import '../navigator/navigator.dart';
import 'utils.dart';

class LoadingOverlay {
  static void show() {
    AlertHelper.show(
      context: AppRouter.instance.navigatorKey.currentState!.context,
      child: const LoadingWidget(),
    );
  }

  static Future<void> dismiss(BuildContext context) async {
    bool? isDiffRoute = ModalRoute.of(context)?.isCurrent != true;
    LoggerHelper.log('isDiffRoute: $isDiffRoute');

    if (isDiffRoute) {
      AppRouter.instance.goBack();
    }
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  static const String fileName = "assets/lottie/state_status/plane.json";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        horizontalSpace(double.infinity),
        // Lottie.asset(fileName, height: h(150), width: w(150), fit: BoxFit.fill),
        verticalSpace(5),
        TextWidget(
          'Loading, please wait...',
          fontSize: sp(16),
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
