import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/app_bar_widget.dart';
import 'package:smartmetermobile/cores/components/box/box_widget.dart';
import 'package:smartmetermobile/cores/components/custom_scaffold_widget.dart';
import 'package:smartmetermobile/cores/components/custom_text_widget.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';

class RequestHistoryView extends StatelessWidget {
  static const String routeName = "request_history";
  const RequestHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: const CustomAppBar(title: "Meter Request History"),
      body: Column(children: [
        BoxWidget(
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            separatorBuilder: (_, __) => const Divider(
              color: Color(0xffE4E7EC),
            ),
            itemBuilder: (context, index) => _itemWidget(),
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

    return const Column(children: [
      Row(children: [
        TextWidget.bold("Onile Bungalow 2", size: size, color: textColor),
        Spacer(),
        TextWidget.bold(
          "Apr 07, 2025",
          size: size,
          color: textColor,
        ),
      ]),
      VSpace(12),
      Row(children: [
        TextWidget("3 Phase Meter", size: size, color: textColor),
        Spacer(),
        TextWidget("Success", size: size, color: Color(0xff12B76A)),
      ]),
    ]);
  }
}
