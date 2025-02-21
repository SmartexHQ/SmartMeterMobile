import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/box/box_widget.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/navigator/app_router.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';
import 'package:smartmetermobile/features/payment/presentaion/view/payment_receipt_view.dart';
import 'package:smartmetermobile/features/shared/widget/search_widget.dart';

class PaymentHomeView extends StatelessWidget {
  static const String routeName = "payment_home";
  const PaymentHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: const CustomAppBar(title: "Payment"),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BoxWidget(
          Row(mainAxisSize: MainAxisSize.min, children: [
            ImageWidget(
              imageTypes: ImageTypes.svg,
              imageUrl: "assets/icon/no_strick.svg",
              height: h(18),
              width: w(18),
            ),
            const HSpace(4),
            const TextWidget(
              "Tamper Fee 5",
              size: 14,
              color: Color(0xff344054),
            ),
          ]),
          borderColor: const Color(0xffD0D5DD),
          color: const Color(0xffF2F4F7),
          padding: EdgeInsets.symmetric(vertical: h(11), horizontal: w(16)),
        ),
        const VSpace(16),
        const SharedSearchWidget(),
        const VSpace(18),
        Row(children: [
          _optionWidget("For Self", "down.svg"),
          const HSpace(16),
          _optionWidget("Newest First", "sort.svg", left: true),
        ]),
        const VSpace(16),
        const TextWidget.bold("Energy Purchase History"),
        const VSpace(16),
        BoxWidget(
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 7,
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
      Row(children: [
        const TextWidget.bold("₦50,000", size: size, color: textColor),
        const Spacer(),
        SizedBox.square(
          dimension: w(16),
          child: const ImageWidget(
            imageTypes: ImageTypes.svg,
            imageUrl: "assets/icon/strick.svg",
            color: Color(0xff53B1FD),
            useIconColor: true,
          ),
        ),
        const HSpace(4),
        const TextWidget.bold("100 kWh", size: size, color: textColor),
      ]),
      const VSpace(12),
      const Row(children: [
        TextWidget("Jan 30, 2025", size: size, color: textColor),
        Spacer(),
        TextWidget("Success", size: size, color: Color(0xff12B76A)),
      ]),
    ]);
  }

  Widget _optionWidget(String title, String img, {bool left = false}) {
    return BoxWidget(
      Row(mainAxisSize: MainAxisSize.min, children: [
        if (left)
          ImageWidget(
            imageTypes: ImageTypes.svg,
            imageUrl: "assets/icon/$img",
            height: h(18),
            width: w(18),
          ),
        if (left) const HSpace(4),
        TextWidget(title, size: 14, color: const Color(0xff344054)),
        if (!left) const HSpace(4),
        if (!left)
          ImageWidget(
            imageTypes: ImageTypes.svg,
            imageUrl: "assets/icon/$img",
            height: h(18),
            width: w(18),
          ),
      ]),
      borderColor: const Color(0xffD0D5DD),
      color: const Color(0xffF2F4F7),
      padding: EdgeInsets.symmetric(vertical: h(11), horizontal: w(16)),
    );
  }
}
