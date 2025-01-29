import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({
    super.key,
    this.strokeWidth,
    this.value,
    this.size,
    this.topPadding = 0,
    this.color,
  });

  final double? strokeWidth;
  final double? value;
  final Size? size;
  final double topPadding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (size != null) {
      return Padding(
        padding: EdgeInsets.only(top: h(topPadding)),
        child: SizedBox(
          width: size!.width,
          height: size!.height,
          child: CupertinoActivityIndicator(
            color: color ?? Colors.grey,
            radius: size!.width / 2,
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: h(topPadding)),
      child: CupertinoActivityIndicator(color: color ?? Colors.grey),
    );
  }
}
