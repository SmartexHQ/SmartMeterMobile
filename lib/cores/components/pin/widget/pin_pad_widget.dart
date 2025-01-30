import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../utils/utils.dart';
import '../../components.dart';

class KeyPad extends StatelessWidget {
  static const double buttonSize = 60.0;
  final TextEditingController pinController;
  final bool showBioMetric;
  final VoidCallback? onBioMetricPressed;

  const KeyPad({
    super.key,
    required this.pinController,
    this.showBioMetric = true,
    this.onBioMetricPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // const VSpace(20),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        buttonWidget(context, '1'),
        buttonWidget(context, '2'),
        buttonWidget(context, '3'),
      ]),
      const VSpace(30),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        buttonWidget(context, '4'),
        buttonWidget(context, '5'),
        buttonWidget(context, '6'),
      ]),
      const VSpace(30),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        buttonWidget(context, '7'),
        buttonWidget(context, '8'),
        buttonWidget(context, '9'),
      ]),
      const VSpace(30),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        if (showBioMetric)
          iconButtonWidget(
            context: context,
            icon: Icon(Icons.fingerprint, size: sp(30), color: Colors.teal),
            color: Colors.teal,
            onTap: () => onBioMetricPressed?.call(),
          )
        else
          SizedBox(height: h(48), width: w(88)),
        buttonWidget(context, '0'),
        iconButtonWidget(
          context: context,
          icon: Icon(Icons.backspace_outlined, size: sp(20)),
          color: const Color(0xff252b2d),
          onTap: () {
            if (pinController.text.isNotEmpty) {
              pinController.text = pinController.text
                  .substring(0, pinController.text.length - 1);
            }
            if (pinController.text.length > 5) {
              pinController.text = pinController.text.substring(0, 3);
            }
          },
        ),
      ]),
    ]);
  }

  Widget buttonWidget(BuildContext context, String buttonText) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (pinController.text.length <= 3) {
          pinController.text = pinController.text + buttonText;
        }
      },
      child: SizedBox.square(
        dimension: w(80),
        child: Center(
          child: TextWidget(
            buttonText,
            fontWeight: FontWeight.w600,
            size: sp(25),
          ),
        ),
      ),
    );
  }

  iconButtonWidget({
    required BuildContext context,
    required Widget icon,
    required Function() onTap,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox.square(dimension: w(80), child: Center(child: icon)),
    );
  }
}
