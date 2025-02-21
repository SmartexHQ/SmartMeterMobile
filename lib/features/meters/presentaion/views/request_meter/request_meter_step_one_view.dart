import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/border/dotted_border.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/navigator/app_router.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';
import 'package:smartmetermobile/features/meters/presentaion/views/request_meter/request_meter_step_two_view.dart';

class RequestMeterViewStepOne extends StatelessWidget {
  static const String routeName = "/request_meter_step_one";
  const RequestMeterViewStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: const CustomAppBar(
        title: "Request Meter",
        actions: TextWidget("Step 1 of 2", color: Color(0xff344054)),
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
        TextFieldWidget(
          title: "Address",
          hintText: "",
          onChanged: (value) {},
        ),
        const VSpace(16),
        DropDownWidget(
          title: "State",
          items: const ["Lagos", "Abuja", "Ogun"],
          onTap: (value) {},
        ),
        const VSpace(16),
        DropDownWidget(
          title: "Local government",
          items: const [],
          onTap: (value) {},
        ),
        const VSpace(16),
        DropDownWidget(
          title: "Meter type",
          items: const ['Postpaid', 'Prepaid'],
          onTap: (value) {},
        ),
        const VSpace(16),
        TextFieldWidget(
          title: "Meter name",
          hintText: "",
          onChanged: (value) {},
        ),
        const TextWidget(
          "e.g Yaba flat Room 3",
          color: Color(0xff475467),
          size: 12,
        ),
        const VSpace(40),
        Button(
          text: "Next",
          onTap: () => AppRouter.instance.navigateTo(
            RequestMeterViewStepTwo.routeName,
          ),
        ),
      ]),
    );
  }
}
