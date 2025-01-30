import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/constants/constants.dart';
import 'package:smartmetermobile/cores/constants/font_size.dart';

import '../navigator/app_router.dart';
import '../utils/sizer_utils.dart';
import 'custom_text_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = "",
    this.showBackButton = true,
    this.centerTitle = true,
    this.actions,
    this.leading,
    this.backColor,
  });

  final String title;
  final bool showBackButton;
  final bool centerTitle;
  final Widget? actions;
  final Widget? leading;
  final Color? backColor;

  @override
  Widget build(BuildContext context) {
    final pad = EdgeInsets.symmetric(vertical: h(10), horizontal: w(20));

    return Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      child: PreferredSize(
        preferredSize: const Size.fromHeight(35),
        child: Padding(
          padding: pad,
          child: Column(children: [
            const VSpace(kToolbarHeight - 10),
            buildIconAndText(context),
          ]),
        ),
      ),
    );
  }

  Widget backButtonWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Navigator.canPop(context)) Navigator.pop(context);
      },
      child: Container(
        height: h(40),
        width: w(40),
        padding: EdgeInsets.only(left: w(5)),
        decoration: BoxDecoration(
          color: backColor ?? Colors.white,
          borderRadius: BorderRadius.circular(sp(12)),
        ),
        child: Center(child: Icon(Icons.arrow_back_ios, size: w(18))),
      ),
    );
  }

  Widget buildIconAndText(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      leading ?? backButtonWidget(context),
      const Spacer(),
      const HSpace(8),
      TextWidget.bold(title, size: kfsMedium),
      const Spacer(),
      const HSpace(8),
      actions ?? SizedBox(width: w(40), height: h(40)),
    ]);
  }

  @override
  Size get preferredSize {
    var extraSpacing = Platform.isIOS ? 5 : 28;
    return Size.fromHeight(kToolbarHeight + extraSpacing);
  }
}

@Deprecated("Use CustomAppBar instead")
class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
    this.title, {
    super.key,
    this.showBackButton = true,
    this.centerText = true,
    this.trilling,
  });

  final String title;
  final bool showBackButton;
  final bool centerText;
  final Widget? trilling;

  @override
  Widget build(BuildContext context) {
    if (centerText == false) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextWidget(title, size: sp(18), fontWeight: FontWeight.w700),
          trilling ?? SizedBox(height: sp(20), width: sp(50)),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        if (showBackButton)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (AppRouter.instance.canGoBack() == false) return;
              AppRouter.instance.goBack();
            },
            child: Container(
              // color: Colors.red,
              transform: Matrix4.translationValues(-20, 0, 0),
              padding: EdgeInsets.symmetric(horizontal: w(20), vertical: h(20)),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: sp(20),
                  color: context.isDarkMode
                      ? null
                      : Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.color
                          ?.withOpacity(0.7),
                ),
              ),
            ),
          )
        else
          SizedBox(height: sp(20), width: sp(40)),
        // const Spacer(),
        Flexible(
          child: TextWidget(
            title,
            size: sp(18),
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
          ),
        ),
        // const Spacer(),
        trilling ?? SizedBox(height: sp(20), width: sp(50)),
      ],
    );
  }
}
