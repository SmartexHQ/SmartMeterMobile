import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';

import '../components/custom_text_widget.dart';
import '../constants/constants.dart';

class SnackBarService {
  static void showErrorSnackBar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black,
      duration: duration,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(
        horizontal: kGlobalPadding,
        vertical: kGlobalPadding / 2,
      ).copyWith(bottom: sh(100) - 150),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: Row(children: [
        const Icon(Icons.error, color: kcErrorColor),
        horizontalSpace(),
        Flexible(
          child: TextWidget(message, textColor: kcWhite),
        ),
      ]),
    ));
  }

  static void showSuccessSnackBar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(
          horizontal: kGlobalPadding,
          vertical: kGlobalPadding / 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Row(children: [
          const Icon(Icons.check_circle, color: kcSuccessColor),
          horizontalSpace(),
          Flexible(
            child: TextWidget(message, textColor: kcWhite),
          ),
        ]),
      ),
    );
  }

  static void showWarningSnackBar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(milliseconds: 1500),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(
          horizontal: kGlobalPadding,
          vertical: kGlobalPadding / 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Row(children: [
          const Icon(Icons.warning, color: kcGrey600),
          horizontalSpace(),
          Flexible(
            child: TextWidget(message, textColor: kcWhite),
          ),
        ]),
      ),
    );
  }
}
