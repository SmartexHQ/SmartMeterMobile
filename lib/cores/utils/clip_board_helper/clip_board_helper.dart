import 'package:flutter/services.dart';
import 'package:smartmetermobile/cores/navigator/app_router.dart';
import 'package:smartmetermobile/cores/utils/snack_bar_service.dart';

class ClipBoardHelper {
  static Future<String?> getClipBoardData() async {
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    return data?.text;
  }

  static Future<void> copyToClipBoard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    SnackBarService.showSuccessSnackBar(
      context: AppRouter.instance.navigatorKey.currentContext!,
      message: "Copied to clipboard",
    );
  }
}
