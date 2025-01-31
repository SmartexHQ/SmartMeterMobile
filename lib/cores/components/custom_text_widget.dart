import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';

import '../constants/font_size.dart';

enum TextType { number, text }

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    super.key,
    this.type = TextType.text,
    this.size = kfsMedium,
    this.color,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.left,
    this.maxLines = 100000,
    this.overflow = TextOverflow.ellipsis,
    this.decoration,
    this.softWrap,
    this.height,
    this.withOpacity,
    this.style,
  });

  const TextWidget.bold(
    this.text, {
    super.key,
    this.type = TextType.text,
    this.size = kfsMedium,
    this.color,
    this.textAlign = TextAlign.left,
    this.maxLines = 100000,
    this.overflow,
    this.decoration,
    this.softWrap,
    this.height = 1,
    this.withOpacity,
    this.style,
  }) : fontWeight = FontWeight.w800;

  const TextWidget.semibold(
    this.text, {
    super.key,
    this.type = TextType.text,
    this.size = kfsMedium,
    this.color,
    this.textAlign = TextAlign.left,
    this.maxLines = 100000,
    this.overflow,
    this.decoration,
    this.softWrap,
    this.height = 1,
    this.withOpacity,
    this.style,
  }) : fontWeight = FontWeight.w600;

  const TextWidget.light(
    this.text, {
    super.key,
    this.type = TextType.text,
    this.size = kfsMedium,
    this.color,
    this.textAlign = TextAlign.left,
    this.maxLines = 100000,
    this.overflow,
    this.decoration,
    this.softWrap,
    this.height = 1,
    this.withOpacity,
    this.style,
  }) : fontWeight = FontWeight.w300;

  final TextType type;
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final double? height;
  final double? withOpacity;
  final bool? softWrap;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: (style ?? GoogleFonts.firaSans()).copyWith(
        fontSize: sp(size ?? 16),
        color: (color ?? Theme.of(context).textTheme.titleMedium!.color)!
            .withOpacity(withOpacity ?? 1.0),
        fontWeight: fontWeight,
        decoration: decoration,
        decorationColor:
            (color ?? Theme.of(context).textTheme.titleMedium!.color)!
                .withOpacity(withOpacity ?? 1.0),
        height: height,
      ),
      textAlign: textAlign,
      overflow: overflow,
      softWrap: softWrap ?? true,
      maxLines: maxLines,
      // textScaleFactor: 0.95,
    );
  }
}

class TwoSpanTextWidget extends StatelessWidget {
  const TwoSpanTextWidget(
    this.text,
    this.text2, {
    super.key,
    this.fontSize = kfsMedium,
    this.fontSize2 = kfsMedium,
    this.textColor,
    this.textColor2,
    this.fontWeight = FontWeight.w400,
    this.fontWeight2 = FontWeight.w400,
    this.textAlign = TextAlign.justify,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.decoration2,
    this.withOpacity,
    this.withOpacity2,
  });

  final String text;
  final String text2;
  final double? fontSize;
  final double? fontSize2;
  final Color? textColor;
  final Color? textColor2;
  final FontWeight? fontWeight;
  final FontWeight? fontWeight2;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final TextDecoration? decoration2;
  final double? withOpacity;
  final double? withOpacity2;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        style: GoogleFonts.inter(
          fontSize: fontSize,
          color: (textColor ?? Theme.of(context).textTheme.titleMedium!.color)!
              .withOpacity(withOpacity ?? 1.0),
          fontWeight: fontWeight,
          decoration: decoration,
          decorationColor: textColor,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: text2,
            style: GoogleFonts.inter(
              fontSize: fontSize2,
              color: (textColor2 ??
                      Theme.of(context).textTheme.titleMedium!.color)!
                  .withOpacity(withOpacity2 ?? 1.0),
              fontWeight: fontWeight2,
              decoration: decoration2,
              decorationColor: textColor2,
            ),
          )
        ],
      ),
      textAlign: textAlign,
    );
  }
}
