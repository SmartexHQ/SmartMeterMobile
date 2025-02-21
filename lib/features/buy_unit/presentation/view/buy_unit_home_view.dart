import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/border/dotted_border.dart';
import 'package:smartmetermobile/cores/components/box/box_widget.dart';
import 'package:smartmetermobile/cores/components/custom_scaffold_widget.dart';
import 'package:smartmetermobile/cores/components/custom_text_widget.dart';
import 'package:smartmetermobile/cores/components/image_widget.dart';
import 'package:smartmetermobile/cores/navigator/app_router.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';
import 'package:smartmetermobile/features/buy_unit/presentation/view/buy_unit_for_others_view.dart';
import 'package:smartmetermobile/features/buy_unit/presentation/view/buy_unit_for_self_view.dart';

class BuyUnitHomeView extends StatelessWidget {
  const BuyUnitHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const TextWidget.bold("Buy Unit", size: 32, color: Color(0xff344054)),
        const VSpace(25),
        DottedBorder(
          padding: EdgeInsets.all(w(16)),
          borderType: BorderType.RRect,
          radius: Radius.circular(sr(8)),
          dashPattern: const [2, 2],
          color: const Color(0xffD0D5DD),
          child: const TextWidget(
            "You can buy energy unit for your meter and for friends and family",
            size: 14,
            color: Color(0xff344054),
          ),
        ),
        const VSpace(16),
        Row(children: [
          buildInfoRow(
            "Buy Unit for Self",
            textColor: const Color(0xff6938EF),
            onTap: () => AppRouter.instance.navigateTo(
              BuyUnitForSelfView.routeName,
            ),
          ),
          const HSpace(12),
          buildInfoRow(
            "Buy Unit for Other",
            textColor: const Color(0xffEC4A0A),
            color: const Color(0xffFDDCAB),
            backgroundColor: const Color(0xffFFF6ED),
            onTap: () => AppRouter.instance.navigateTo(
              BuyUnitForOthersView.routeName,
            ),
          ),
        ]),
      ]),
    );
  }

  Widget buildInfoRow(
    String title, {
    Color? color,
    Color? backgroundColor,
    required Color textColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: BoxWidget(
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          HSpace(sw(40)),
          ImageWidget(
            imageTypes: ImageTypes.svg,
            imageUrl: "assets/icon/strick.svg",
            height: h(32),
            width: w(24),
            color: textColor,
            useIconColor: true,
          ),
          TextWidget(title, color: textColor),
        ]),
        color: backgroundColor ?? const Color(0xffF4F3FF),
        borderColor: color ?? const Color(0xffD9D6FE),
      ),
    );
  }
}
