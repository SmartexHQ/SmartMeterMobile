import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/box/box_widget.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/constants/color.dart';
import 'package:smartmetermobile/cores/navigator/app_router.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';
import 'package:smartmetermobile/features/meters/presentaion/views/comsumption_history/comsumption_history_view.dart';
import 'package:smartmetermobile/features/meters/presentaion/views/edit_meter/edit_meter_view.dart';
import 'package:smartmetermobile/features/meters/presentaion/views/meter_switch/meter_switch_view.dart';
import 'package:smartmetermobile/features/payment/presentaion/view/payment_receipt_view.dart';

class MeterInfoView extends StatelessWidget {
  static const String routeName = '/meter_info_view';
  const MeterInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: const CustomAppBar(title: "Meter Information"),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BoxWidget(
          Column(spacing: h(16), children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => AppRouter.instance.navigateTo(
                EditMeterView.routeName,
              ),
              child: buildInfoRow(
                "Meter Name",
                "Yaba Flat Room 3",
                canEidt: true,
              ),
            ),
            buildInfoRow("Meter Number", "58101245502"),
            buildInfoRow("Units Left", "51.23 kWh"),
            buildInfoRow("Status", "Active"),
            buildInfoRow("Tariff", "JHF | 34.50"),
            buildInfoRow("Disco", "Ikeja Electricity"),
            buildInfoRow("Meter Type", "1PPD"),
            buildInfoRow("Activation Date", "Nov 11, 2020"),
          ]),
          color: const Color(0xff2E90FA),
        ),
        const VSpace(16),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _headerAction("Consumption History", onTap: () {
            AppRouter.instance.navigateTo(ComsumptionHistoryView.routeName);
          }),
          _headerAction("Meter Switch", onTap: () {
            AppRouter.instance.navigateTo(MeterSwitchView.routeName);
          }),
        ]),
        const VSpace(22),
        const TextWidget.semibold("Energy Purchase History", size: 16),
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

  Widget _headerAction(String text, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: sw(44),
        child: BoxWidget(
          Center(
            child: TextWidget.semibold(text, color: kcPrimaryColor, size: 12.5),
          ),
          padding: EdgeInsets.symmetric(horizontal: w(20), vertical: h(14)),
        ),
      ),
    );
  }

  Widget buildInfoRow(String title, String value, {bool canEidt = false}) {
    return Row(children: [
      TextWidget('$title: ', color: kcWhite, size: 14),
      const Spacer(),
      TextWidget.semibold(value, size: 14, color: kcWhite),
      if (canEidt) const HSpace(4),
      if (canEidt) const Icon(Icons.edit_document, color: kcWhite, size: 12),
    ]);
  }
}
