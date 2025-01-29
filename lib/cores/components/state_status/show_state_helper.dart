import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import 'confrim_state_widget.dart';
import 'error_state_widget.dart';
import 'success_state_widget.dart';

enum ShowStateType {
  loading,
  error,
  success,
}

class ShowStateHelper {
  static Future<dynamic> show({
    required ShowStateType type,
    required BuildContext context,
    required String title,
    required String message,
    Function()? onTap,
    bool isDismissible = true,
  }) {
    switch (type) {
      case ShowStateType.loading:
        return _showLoading(
          context,
          title: title,
          message: message,
          onTap: onTap,
          isDismissible: isDismissible,
        );
      case ShowStateType.error:
        return _showError(
          context,
          title: title,
          message: message,
          onTap: onTap,
          isDismissible: isDismissible,
        );
      case ShowStateType.success:
        return _showSuccess(
          context: context,
          title: title,
          message: message,
          onTap: onTap,
          isDismissible: isDismissible,
        );
    }
  }

  static Future<dynamic> _showLoading(
    BuildContext context, {
    required String title,
    required String message,
    Function()? onTap,
    bool isDismissible = true,
  }) {
    return BottomSheetHelper.show(
      isDismissible: isDismissible,
      context: context,
      child: ConfirmStateWidget(
        title: title,
        message: message,
        isLoading: true,
        onTap: onTap,
      ),
    );
  }

  static Future<dynamic> _showError(
    BuildContext context, {
    required String title,
    required String message,
    Function()? onTap,
    bool isDismissible = true,
  }) {
    return BottomSheetHelper.show(
      isDismissible: isDismissible,
      context: context,
      child: ErrorStateWidget(title: title, message: message, onTap: onTap),
    );
  }

  static Future<dynamic> _showSuccess({
    required BuildContext context,
    required String title,
    required String message,
    Function()? onTap,
    bool isDismissible = true,
  }) {
    return BottomSheetHelper.show(
      isDismissible: isDismissible,
      context: context,
      child: SuccessStateWidget(title: title, message: message, onTap: onTap),
    );
  }
}
