import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';

class BoxWidget extends StatelessWidget {
  final Widget child;
  final double radius;
  final Color? color;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;

  const BoxWidget(
    this.child, {
    super.key,
    this.radius = 8,
    this.color,
    this.borderColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(w(16)),
      decoration: BoxDecoration(
        color: color ?? const Color(0xffEFF8FF),
        border: Border.all(color: borderColor ?? const Color(0xffB2DDFF)),
        borderRadius: BorderRadius.circular(sr(radius)),
      ),
      child: child,
    );
  }
}
