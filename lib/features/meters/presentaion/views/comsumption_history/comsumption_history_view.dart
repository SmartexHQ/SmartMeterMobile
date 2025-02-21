import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/app_bar_widget.dart';
import 'package:smartmetermobile/cores/components/box/box_widget.dart';
import 'package:smartmetermobile/cores/components/custom_scaffold_widget.dart';
import 'package:smartmetermobile/cores/components/custom_text_widget.dart';
import 'package:smartmetermobile/cores/components/image_widget.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';

class ComsumptionHistoryView extends StatelessWidget {
  static const String routeName = 'comsumption_history';
  const ComsumptionHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: const CustomAppBar(
        title: "Consumption History",
      ),
      body: BoxWidget(
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 20,
          separatorBuilder: (_, __) => const Divider(
            color: Color(0xffE4E7EC),
          ),
          itemBuilder: (context, index) => _itemWidget(),
        ),
        color: const Color(0xffF2F4F7),
        borderColor: const Color(0xffF2F4F7),
      ),
    );
  }

  Widget _itemWidget() {
    const textColor = Color(0xff344054);
    const size = 12.0;

    return Column(children: [
      Row(children: [
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
        const Spacer(),
        const TextWidget.bold(
          "Apr 07, 2025 | 10:24 pm",
          size: size,
          color: textColor,
        ),
      ]),
      const VSpace(12),
      const Row(children: [
        TextWidget("Current: 0.00", size: size, color: textColor),
        Spacer(),
        TextWidget("Voltage: 219.20", size: size, color: textColor),
      ]),
    ]);
  }
}
