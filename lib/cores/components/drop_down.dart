import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color.dart';
import '../constants/font_size.dart';
import '../utils/sizer_utils.dart';
import 'custom_text_widget.dart';

class DropDownWidget<T> extends StatelessWidget {
  const DropDownWidget({
    super.key,
    this.title,
    required this.items,
    this.value,
    this.onTap,
    this.hintText,
    this.fillColor,
  });

  final List<T> items;
  final String? title;
  final String? hintText;
  final T? value;
  final Function(T val)? onTap;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Visibility(
        visible: title != null,
        child: TextWidget.semibold(title ?? "", size: sp(16)),
      ),
      const VSpace(5),
      DropdownButtonFormField<T>(
        // isDense: true,
        borderRadius: BorderRadius.circular(sr(8.0)),
        value: value,
        icon: const Icon(Icons.keyboard_arrow_down),
        style: GoogleFonts.inter(
          color: Theme.of(context).textTheme.titleMedium!.color,
          fontWeight: FontWeight.w600,
          fontSize: sp(16),
        ),
        items: items.map((T items) {
          return DropdownMenuItem(
            value: items,
            child: TextWidget(items.toString()),
          );
        }).toList(),
        onChanged: (T? newValue) {
          if (newValue == null && onTap == null) return;

          onTap!(newValue as T);
        },
        iconEnabledColor: kcPrimaryColor,
        isExpanded: true,
        decoration: InputDecoration(
          // isDense: true,
          // contentPadding: EdgeInsets.all(h(16)),
          contentPadding: EdgeInsets.fromLTRB(w(16), w(0), w(16), w(16)),
          // errorMaxLines: 2,
          // errorStyle: GoogleFonts.raleway(
          //   fontSize: widget.showErrorMessage ? null : 0,
          // ),
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
          hintText: hintText,
          hintStyle: GoogleFonts.raleway(
            color: kcTextNeutral300,
            fontWeight: FontWeight.w400,
            fontSize: kfsMedium,
          ),
          // alignLabelWithHint: true,
          // prefixIcon: prefix,
          // suffixIcon: _buildSuffixWidget(value),
        ),
      ),
    ]);
  }
}
