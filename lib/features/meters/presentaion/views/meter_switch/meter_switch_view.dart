import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/box/box_widget.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/constants/constants.dart';
import 'package:smartmetermobile/cores/utils/bottom_modal.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';

class MeterSwitchView extends StatefulWidget {
  static const String routeName = '/meter-switch';
  const MeterSwitchView({super.key});

  @override
  State<MeterSwitchView> createState() => _MeterSwitchViewState();
}

class _MeterSwitchViewState extends State<MeterSwitchView> {
  @override
  Widget build(BuildContext context) {
    const color = Color(0xff344054);

    return ScaffoldWidget(
      appBar: const CustomAppBar(title: ":Meter Switch"),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BoxWidget(
          Row(children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget.bold(
                    "You  can control you meter here",
                    color: color,
                  ),
                  VSpace(),
                  TextWidget(
                    "If you turn off the switch, your meter will power down. The process takes place within a minute",
                    color: color,
                    size: 12,
                    height: 1,
                  ),
                ],
              ),
            ),
            Transform.scale(
              scale: 0.8,
              child: Switch(
                value: true,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (_) {
                  BottomSheetHelper.show(
                    context: context,
                    child: _sheetWidget(),
                  );
                },
              ),
            ),
          ]),
          color: const Color(0xffF2F4F7),
          borderColor: const Color(0xffF2F4F7),
        ),
        const VSpace(16),
        const TextWidget.bold("History"),
        const VSpace(16),
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

    return Padding(
      padding: EdgeInsets.only(top: h(8)),
      child: const Row(children: [
        TextWidget.bold("Switch On", size: size, color: textColor),
        Spacer(),
        TextWidget.bold(
          "Apr 07, 2025 | 10:24 pm",
          size: size,
          color: textColor,
        ),
      ]),
    );
  }

  Widget _sheetWidget() {
    return Column(children: [
      const VSpace(20),
      const TextWidget.bold(
        "Are you sure you want to turn off this meter?",
        size: 24,
        color: kcPrimaryColor,
        textAlign: TextAlign.center,
      ),
      const VSpace(57),
      Row(children: [
        Expanded(
          child: Button.withBorderLine(
            text: "No",
            textColor: kcPrimaryColor,
            borderColor: const Color(0xffB2DDFF),
            color: const Color(0xffEFF8FF),
            onTap: () {},
          ),
        ),
        const HSpace(16),
        Expanded(child: Button(text: "Yes", onTap: () {})),
      ]),
      const VSpace(30),
    ]);
  }
}
