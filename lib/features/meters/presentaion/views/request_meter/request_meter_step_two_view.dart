import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/border/dotted_border.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/constants/color.dart';
import 'package:smartmetermobile/cores/utils/utils.dart';

class RequestMeterViewStepTwo extends StatelessWidget {
  static const String routeName = "/request_meter_step_two";
  const RequestMeterViewStepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: const CustomAppBar(
        title: "Request Meter",
        actions: TextWidget("Step 2 of 2", color: Color(0xff344054)),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        DottedBorder(
          padding: EdgeInsets.all(w(16)),
          borderType: BorderType.RRect,
          radius: Radius.circular(sr(8)),
          dashPattern: const [2, 2],
          color: const Color(0xffD0D5DD),
          child: const TextWidget(
            "Please provide the details for the location where the meter will be installed.",
            size: 14,
            color: Color(0xff344054),
          ),
        ),
        const VSpace(24),
        DropDownWidget(
          title: "Premises type",
          items: const [
            "Duplex",
            "Flat",
            "2 Bedroom",
            "Tenement",
            "Individual"
          ],
          onTap: (value) {},
        ),
        const VSpace(16),
        DropDownWidget(
          title: "Use of premises",
          items: const [],
          onTap: (value) {},
        ),
        const VSpace(16),
        DropDownWidget(
          title: "Identification card type",
          items: const [],
          onTap: (value) {},
        ),
        const VSpace(16),
        DropDownWidget(
          title: "Identification number",
          hintText: "",
          items: const [],
          onTap: (value) {},
        ),
        const VSpace(40),
        Row(children: [
          Opacity(
            opacity: 0.5,
            child: Checkbox(
              value: false,
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (value) {},
            ),
          ),
          const HSpace(4),
          const Flexible(
            child: TextWidget(
              "I declare that the information provided above is accurate and true",
              color: Color(0xff475467),
              size: 12,
            ),
          ),
        ]),
        const VSpace(40),
        Button(
          text: "Request for Meter",
          onTap: () => BottomSheetHelper.show(
            context: context,
            child: _sheetWidget(),
          ),
        ),
      ]),
    );
  }

  Widget _sheetWidget() {
    return Column(children: [
      const VSpace(20),
      const TextWidget.bold(
        "Request sent successfully",
        size: 24,
        color: kcPrimaryColor,
        textAlign: TextAlign.center,
      ),
      const VSpace(16),
      const TextWidget(
        "One of our agents will reach out to you as soon as possible",
        color: Color(0xff344054),
        textAlign: TextAlign.center,
      ),
      const VSpace(33),
      Button(text: "Done", onTap: () {}),
      const VSpace(30),
    ]);
  }
}
