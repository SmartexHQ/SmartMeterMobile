// import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/custom_text_widget.dart';
import 'package:smartmetermobile/cores/components/image_widget.dart';

import '../constants/color.dart';
import 'sizer_utils.dart';

class BottomSheetHelper {
  static Future<dynamic> show({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
    Color? bgColor,
  }) async {
    return await showModalBottomSheet(
      backgroundColor: kcGrey100.withOpacity(0.05),
      isScrollControlled: true,
      enableDrag: true,
      context: context,
      isDismissible: isDismissible,
      builder: (BuildContext context) => SingleChildScrollView(
        child: AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 100),
          curve: Curves.decelerate,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: sp(15), vertical: sp(20)),
            decoration: BoxDecoration(
              color: bgColor ?? Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(sp(15)),
                topRight: Radius.circular(sp(15)),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  static Future<dynamic> showHalfScreen({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
  }) async {
    return await showModalBottomSheet(
      backgroundColor: kcGrey100.withOpacity(0.05),
      isScrollControlled: true,
      enableDrag: true,
      context: context,
      isDismissible: isDismissible,
      builder: (BuildContext context) => SingleChildScrollView(
        child: AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 100),
          curve: Curves.decelerate,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: sp(15), vertical: sp(20)),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(sp(15)),
                topRight: Radius.circular(sp(15)),
              ),
            ),
            child: SizedBox(height: sh(68), child: child),
          ),
        ),
      ),
    );
  }

// static Future<dynamic> showCupertinoSheet({
//   required BuildContext context,
//   required Widget child,
//   bool isDismissible = true,
// }) async {
//   return await showCupertinoModalSheet(
//     firstTransition: CupertinoModalSheetRouteTransition.scale,
//     context: context,
//     builder: (context) {
//       return Container(
//         padding: EdgeInsets.symmetric(horizontal: sp(15), vertical: sp(20)),
//         decoration: BoxDecoration(
//           color: Theme.of(context).scaffoldBackgroundColor,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(sp(15)),
//             topRight: Radius.circular(sp(15)),
//           ),
//         ),
//         child: child,
//       );
//     },
//   );
// }
}

class PopupHelper {
  // Method to show the popup
  static void showPopup(
    BuildContext context,
    String message, {
    Function()? onClose,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Stack(children: [
            Container(
              height: h(300),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HSpace(240),
                  const ImageWidget(
                    imageTypes: ImageTypes.svg,
                    imageUrl: "assets/svg/check.svg",
                  ),
                  const VSpace(),
                  SizedBox(
                    width: 150,
                    child: TextWidget(message, textAlign: TextAlign.center),
                  ),
                  const VSpace(16.0),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: ElevatedButton(
                  //     onPressed: () => Navigator.of(context).pop(),
                  //     child: const Text('Close'),
                  //   ),
                  // ),
                ],
              ),
            ),
            Positioned(
              right: 16,
              top: 12,
              child: GestureDetector(
                onTap: () {
                  onClose?.call() ?? Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(w(8)),
                  decoration: const BoxDecoration(
                    color: Color(0xffF0F2F5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, size: 16),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
