import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/border/dotted_border.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/constants/color.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';

class UnitPaymentReceiptView extends StatelessWidget {
  static const String routeName = '/unit_payment-receipt';
  const UnitPaymentReceiptView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: const CustomAppBar(title: "Payment Receipt"),
      body: Column(children: [
        DottedBorder(
          padding: EdgeInsets.all(w(16)),
          borderType: BorderType.RRect,
          radius: Radius.circular(sr(8)),
          dashPattern: const [2, 2],
          color: const Color(0xffD0D5DD),
          child: Column(children: [
            const TextWidget.bold("Summary", size: 32, color: kcPrimaryColor),
            const VSpace(20),
            buildInfoRow("Amount", "₦100,000.00"),
            dottedDivider(),
            buildInfoRow("Units purchased:", "400 kWh "),
            dottedDivider(),
            buildInfoRow("Meter name", "Yaba Flat Room 3"),
            dottedDivider(),
            buildInfoRow("Meter number:", "58101245502"),
            dottedDivider(),
            buildInfoRow("Token", "2456 3673 5276 5742 9045"),
            dottedDivider(),
            buildInfoRow("Status", "Success"),
            dottedDivider(),
            buildInfoRow("Purchase type", "Self Purchase"),
            dottedDivider(),
            buildInfoRow("Date & time", "Nov 11, 2020 | 12:45 pm"),
            dottedDivider(),
            buildInfoRow(
              "Address",
              "23 Herbert Macaulay Way, Yaba, Lagos, Nigeria.",
            ),
            dottedDivider(),
            buildInfoRow("Disco", "Ikeja Electricity"),
            dottedDivider(),
            buildInfoRow("Receipt number", "SNL-42-637-14693"),
            dottedDivider(),
            buildInfoRow("VAT", "₦185.00"),
            const VSpace(30),
            buildInfoRow("Charge fee", "₦100.00"),
            const VSpace(30),
            buildInfoRow("Total Fee", "₦50,285.00"),
          ]),
        ),
        const VSpace(40),
        Button(text: "Print Receipt", onTap: () {}),
      ]),
    );
  }

  Widget dottedDivider() {
    return SizedBox(
      height: h(30),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const HSpace(4),
        itemCount: 100,
        itemBuilder: (_, indxe) {
          return Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: h(18)),
              width: w(4),
              height: h(1),
              color: const Color(0xff98A2B3),
            ),
          );
        },
      ),
    );
  }

  Widget buildInfoRow(String title, String value) {
    return Row(children: [
      Expanded(
        child: TextWidget('$title: ', size: 14, color: const Color(0xff344054)),
      ),
      Expanded(
        child: TextWidget.semibold(
          value,
          size: 14,
          color: const Color(0xff475467),
          textAlign: TextAlign.right,
        ),
      ),
    ]);
  }
}
