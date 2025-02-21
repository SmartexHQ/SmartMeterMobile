import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/border/dotted_border.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/utils/utils.dart';

class EditMeterView extends StatelessWidget {
  static const String routeName = "/edit_meter";
  const EditMeterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: const CustomAppBar(title: "Edit Meter Name"),
      body: Column(children: [
        DottedBorder(
          padding: EdgeInsets.all(w(16)),
          borderType: BorderType.RRect,
          radius: Radius.circular(sr(8)),
          dashPattern: const [2, 2],
          color: const Color(0xffD0D5DD),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HSpace(sw(100)),
              const TextWidget(
                "Choose names that reflect the location of the meter. ",
                size: 14,
                color: Color(0xff344054),
              ),
              const TextWidget(
                "e.g Yaba Flat Room 7",
                size: 14,
                color: Color(0xff344054),
              )
            ],
          ),
        ),
        const VSpace(16),
        const TextFieldWidget(
          title: "Enter new meter name",
          hintText: "",
        ),
        const VSpace(40),
        Button(text: "Save", onTap: () {}),
      ]),
    );
  }
}
