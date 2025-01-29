// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartmetermobile/cores/constants/font_size.dart';

import '../../cores/constants/color.dart';
import '../../cores/utils/sizer_utils.dart';
import 'custom_text_widget.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    this.textEditingController,
    this.autoCorrect = true,
    required this.hintText,
    this.title,
    this.validator,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.enabled = true,
    this.maxLine = 1,
    this.suffix,
    this.suffixWidget,
    this.prefix,
    this.onChanged,
    this.onSubmitted,
    this.boldHintText = false,
    this.inputFormatters,
    this.prefixText,
    this.focusNode,
    this.showErrorMessage = true,
    this.showBorder = false,
  });

  final TextEditingController? textEditingController;
  final bool autoCorrect;
  final String hintText;
  final String? title;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputType textInputType;
  final bool isPassword;
  final bool enabled;
  final bool boldHintText;
  final int? maxLine;
  final IconData? suffix;
  final Widget? suffixWidget;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final FocusNode? focusNode;
  final bool showErrorMessage;
  final bool showBorder;

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureText,
      builder: (BuildContext context, bool value, dynamic child) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (widget.title != null) TextWidget.semibold(widget.title!),
          const VSpace(5),
          TextFormField(
            focusNode: widget.focusNode,
            inputFormatters: widget.inputFormatters,
            maxLines: widget.maxLine,
            enabled: widget.enabled,
            style: GoogleFonts.raleway(
              color: kcTextColor,
              fontWeight: FontWeight.w600,
              fontSize: kfsMedium,
            ),
            controller: widget.textEditingController,
            autocorrect: widget.autoCorrect,
            autovalidateMode: widget.validator != null
                ? AutovalidateMode.onUserInteraction
                : null,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(h(16)),
              errorMaxLines: 2,
              errorStyle: GoogleFonts.raleway(
                fontSize: widget.showErrorMessage ? null : 0,
              ),
              filled: false,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: kcTextNeutral100),
                borderRadius: BorderRadius.circular(sr(8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kcTextNeutral100),
                borderRadius: BorderRadius.circular(sr(8)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kcErrorColor),
                borderRadius: BorderRadius.circular(sr(8)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kcTextNeutral100),
                borderRadius: BorderRadius.circular(sr(8)),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(sr(8)),
              ),
              hintText: widget.hintText,
              hintStyle: GoogleFonts.raleway(
                color: kcTextNeutral300,
                fontWeight: FontWeight.w400,
                fontSize: kfsMedium,
              ),
              prefixIcon: widget.prefix,
              suffixIcon: _buildSuffixWidget(value),
            ),
            keyboardType: widget.textInputType,
            obscureText: value && widget.isPassword,
            validator: (String? val) {
              if (val == null || widget.validator == null) return null;

              return widget.validator!(val.trim());
            },
            onChanged: (String val) {
              if (widget.onChanged == null) return;
              widget.onChanged!(val.trim());
            },
            onFieldSubmitted: (String val) {
              if (widget.onSubmitted == null) return;
              widget.onSubmitted!(val.trim());
            },
            // onTapOutside: (_) {
            //   FocusScope.of(context).unfocus();
            // },
          ),
        ]);
      },
    );
  }

  Widget _buildSuffixWidget(value) {
    if (widget.suffixWidget != null) {
      return widget.suffixWidget!;
    } else if (widget.isPassword == true) {
      return suffixWidget(value);
    } else {
      if (widget.suffix != null) {
        return Icon(widget.suffix);
      } else {
        return const SizedBox();
      }
    }
  }

  IconButton suffixWidget(bool value) {
    if (value) {
      return IconButton(
        icon: const Icon(CupertinoIcons.eye_slash_fill),
        color: const Color(0xFFA0AFB4),
        onPressed: () => obscureText.value = !obscureText.value,
      );
    } else {
      return IconButton(
        icon: const Icon(CupertinoIcons.eye_fill),
        color: const Color(0xFFA0AFB4),
        onPressed: () => obscureText.value = !obscureText.value,
      );
    }
  }
}

class BorderlessTextFieldWidget extends StatefulWidget {
  const BorderlessTextFieldWidget({
    super.key,
    this.textEditingController,
    this.autoCorrect = true,
    required this.hintText,
    this.fontSize,
    this.title,
    this.validator,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.enabled = true,
    this.maxLine = 1,
    this.prefix,
    this.onChanged,
    this.onSubmitted,
    this.boldHintText = false,
    this.inputFormatters,
    this.prefixText,
    this.suffixWidget,
    this.textAlign = TextAlign.left,
  });

  final double? fontSize;
  final TextEditingController? textEditingController;
  final bool autoCorrect;
  final String hintText;
  final String? title;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputType textInputType;
  final bool isPassword;
  final bool enabled;
  final bool boldHintText;
  final int? maxLine;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final TextAlign textAlign;
  final Widget? suffixWidget;

  @override
  _BorderlessTextFieldWidgetState createState() =>
      _BorderlessTextFieldWidgetState();
}

class _BorderlessTextFieldWidgetState extends State<BorderlessTextFieldWidget> {
  final ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    // final isDarkMode = context.isDarkMode;

    return ValueListenableBuilder<bool>(
      valueListenable: obscureText,
      builder: (BuildContext context, bool value, dynamic child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title != null)
              TextWidget(
                widget.title!,
                fontSize: sp(14),
                fontWeight: FontWeight.w300,
                withOpacity: .5,
              ),
            TextFormField(
              inputFormatters: widget.inputFormatters,
              maxLines: widget.maxLine,
              enabled: widget.enabled,
              style: GoogleFonts.karla(
                color: Theme.of(context).textTheme.titleMedium!.color,
                fontWeight: FontWeight.w600,
                fontSize: sp(widget.fontSize ?? 13),
              ),
              controller: widget.textEditingController,
              autocorrect: widget.autoCorrect,
              autovalidateMode: widget.validator != null
                  ? AutovalidateMode.onUserInteraction
                  : null,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: widget.suffixWidget,
                prefixText: widget.prefixText,
                prefixStyle: GoogleFonts.rubik(
                  color: Theme.of(context).textTheme.titleMedium!.color,
                  fontWeight: FontWeight.w600,
                  fontSize: sp(13),
                ),
                errorMaxLines: 2,
                hintText: widget.hintText,
                hintStyle: GoogleFonts.karla(
                  color: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .color!
                      .withOpacity(0.3),
                  fontWeight: FontWeight.w500,
                  fontSize: sp(widget.fontSize ?? 13),
                ),
                prefixIcon: widget.prefix,
              ),
              keyboardType: widget.textInputType,
              obscureText: value && widget.isPassword,
              validator: (String? val) {
                if (val == null || widget.validator == null) return null;

                return widget.validator!(val.trim());
              },
              onChanged: (String val) {
                if (widget.onChanged == null) return;

                widget.onChanged!(val.trim());
              },
              onFieldSubmitted: (String val) {
                if (widget.onSubmitted == null) return;

                widget.onSubmitted!(val.trim());
              },
              textAlign: widget.textAlign,
            ),
          ],
        );
      },
    );
  }
}
