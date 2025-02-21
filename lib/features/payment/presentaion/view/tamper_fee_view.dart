import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/app_bar_widget.dart';
import 'package:smartmetermobile/cores/components/box/box_widget.dart';
import 'package:smartmetermobile/cores/components/custom_scaffold_widget.dart';
import 'package:smartmetermobile/cores/components/custom_text_widget.dart';
import 'package:smartmetermobile/cores/components/image_widget.dart';
import 'package:smartmetermobile/cores/constants/color.dart';
import 'package:smartmetermobile/cores/navigator/app_router.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';
import 'package:smartmetermobile/features/payment/presentaion/view/payment_receipt_view.dart';

class TamperFeeView extends StatelessWidget {
  static const String routeName = "tamper_fee";
  const TamperFeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: CustomAppBar(
        title: "Tamper Fee",
        actions: ImageWidget(
          imageTypes: ImageTypes.svg,
          imageUrl: "assets/icon/download.svg",
          height: h(40),
          width: w(40),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BoxWidget(
          Row(mainAxisSize: MainAxisSize.min, children: [
            ImageWidget(
              imageTypes: ImageTypes.svg,
              imageUrl: "assets/icon/sort.svg",
              height: h(18),
              width: w(18),
            ),
            const HSpace(4),
            const TextWidget(
              "Newest First",
              size: 14,
              color: Color(0xff344054),
            ),
          ]),
          borderColor: const Color(0xffD0D5DD),
          color: const Color(0xffF2F4F7),
          padding: EdgeInsets.symmetric(vertical: h(11), horizontal: w(16)),
        ),
        const VSpace(16),
        BoxWidget(
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            separatorBuilder: (_, __) => const Divider(
              color: Color(0xffE4E7EC),
            ),
            itemBuilder: (context, index) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => AppRouter.instance.navigateTo(
                PaymentReceiptView.routeName,
              ),
              child: _itemWidget(),
            ),
          ),
          color: const Color(0xffF2F4F7),
          borderColor: const Color(0xffF2F4F7),
        ),
      ]),
    );
  }

  Widget _itemWidget() {
    const textColor = Color(0xff344054);
    const size = 12.0;

    return Column(children: [
      const Row(children: [
        TextWidget.bold("₦5,000", size: size, color: textColor),
        Spacer(),
        TextWidget.bold(
          "Apr 07, 2025 | 10:24 pm",
          size: size,
          color: textColor,
        ),
      ]),
      const VSpace(12),
      Row(children: [
        const TextWidget("Pending", size: size, color: Color(0xffDC6803)),
        const Spacer(),
        BoxWidget(
          const TextWidget("Pay Now", size: 14, color: kcPrimaryColor),
          padding: EdgeInsets.symmetric(vertical: h(6), horizontal: w(8)),
        ),
      ]),
    ]);
  }
}
