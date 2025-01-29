// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/custom_text_widget.dart';
import 'package:smartmetermobile/cores/components/loading_indicator.dart';

import '../../cores/constants/color.dart';
import '../constants/font_size.dart';
import '../utils/sizer_utils.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
    this.textSize = kfsMedium,
    this.height,
    this.width,
    this.textFontWeight = FontWeight.w600,
    this.circular = false,
    this.active = true,
  })  : busy = false,
        iconData = null,
        borderColor = null,
        iconSize = null,
        iconColor = null;

  const Button.withBorderLine({
    Key? key,
    required this.text,
    required this.onTap,
    this.color = Colors.transparent,
    this.borderColor = kcPrimaryColor,
    this.textColor = kcPrimaryColor,
    this.textSize = kfsMedium,
    this.height,
    this.width,
    this.textFontWeight = FontWeight.w600,
    this.circular = false,
    this.active = true,
    this.iconData,
    this.iconColor,
  })  : busy = false,
        iconSize = null;

  const Button.loading({
    Key? key,
    this.onTap,
    this.color,
    this.height,
    this.width,
  })  : busy = true,
        iconData = null,
        text = null,
        textColor = null,
        textSize = kfsMedium,
        textFontWeight = null,
        iconSize = null,
        iconColor = null,
        borderColor = null,
        active = true,
        circular = false;

  const Button.smallSized({
    Key? key,
    this.text,
    this.onTap,
    this.color,
    this.textColor,
    this.textSize = kfsMedium,
    this.height,
    this.width,
    this.textFontWeight,
    this.circular = false,
    this.active = true,
  })  : busy = false,
        iconData = null,
        iconSize = null,
        borderColor = null,
        iconColor = null;

  const Button.icon({
    Key? key,
    this.text,
    this.iconData,
    this.height,
    this.width,
    this.onTap,
    this.color,
    this.iconColor,
    this.iconSize,
    this.circular = false,
    this.active = true,
    this.borderColor,
    this.textColor,
  })  : busy = false,
        textSize = kfsMedium,
        textFontWeight = null;

  final String? text;
  final Widget? iconData;
  final void Function()? onTap;
  final bool busy;
  final bool active;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? textSize;
  final double? height;
  final double? width;
  final FontWeight? textFontWeight;
  final Color? iconColor;
  final double? iconSize;
  final bool circular;

  @override
  Widget build(BuildContext context) {
    const double defaultHeight = 55;
    final double defaultWidth = MediaQuery.of(context).size.width * 0.95;

    return SizedBox(
      height: sp(height ?? defaultHeight),
      width: sp(width ?? defaultWidth),
      child: TextButton(
        key: key,
        onPressed: () {
          if (active == false) return;
          onTap?.call();
        },
        style: getButtonStyle(context),
        child: getButtonChild(context),
      ),
    );
  }

  ButtonStyle getButtonStyle(BuildContext context) {
    WidgetStateProperty<RoundedRectangleBorder> shape;

    if (circular) {
      shape = WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sr(100.0)),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
      );
    } else {
      shape = WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sr(42)),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
      );
    }

    WidgetStateProperty<Color> backgroundColor;
    if (busy) {
      backgroundColor = WidgetStateProperty.all(kcPrimaryColor);
    } else if (active == false) {
      final buttonColor =
          context.isDarkMode ? const Color(0xff8C9A9E) : kcGrey400;
      backgroundColor = WidgetStateProperty.all(buttonColor);
    } else {
      final buttonColor = context.isDarkMode ? kcWhite : kcPrimaryColor;
      backgroundColor = WidgetStateProperty.all(color ?? buttonColor);
    }

    return ButtonStyle(shape: shape, backgroundColor: backgroundColor);
  }

  Widget getButtonChild(BuildContext context) {
    Color buttonTextColor;
    if (context.isDarkMode) {
      buttonTextColor = active == false ? kcTextNeutral700 : kcPrimaryColor;
    } else {
      buttonTextColor = Colors.white;
    }

    if (text == null) {
      if (busy) {
        return SizedBox(
          height: sp(21),
          width: sp(21),
          child: const LoadingIndicatorWidget(color: Colors.white),
        );
      } else {
        return iconData ?? const SizedBox();
        // return Icon(
        //   iconData,
        //   color:
        //       iconColor ?? (context.isDarkMode ? kcPrimaryColor : Colors.white),
        //   size: iconSize ?? 20.0,
        // );
      }
    } else {
      if (iconData != null) {
        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          iconData ?? const SizedBox(),
          if (text != null) const HSpace(),
          if (text != null)
            TextWidget(
              text ?? 'no text',
              textColor: textColor ?? buttonTextColor,
              fontWeight: textFontWeight,
            ),
        ]);
      }

      return TextWidget(
        text ?? 'no text',
        textColor: textColor ?? buttonTextColor,
        fontSize: sp(15),
        fontWeight: textFontWeight,
      );
    }
  }
}
