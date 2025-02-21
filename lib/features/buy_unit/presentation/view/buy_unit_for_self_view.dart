import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/navigator/navigator.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';
import 'package:smartmetermobile/features/payment/presentaion/view/unit_payment_receipt_view.dart';

class BuyUnitForSelfView extends StatelessWidget {
  static const String routeName = "buy_unit_for_self";
  const BuyUnitForSelfView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: const CustomAppBar(title: "Buy Unit For Self"),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropDownWidget(
            title: "Select your meter",
            hintText: "",
            items: const [],
            onTap: (_) {},
          ),
          const VSpace(16),
          TextFieldWidget(
            hintText: "",
            title: "Enter Amount",
            onChanged: (_) {},
          ),
          const VSpace(2),
          const TextWidget(
            "Mininum amount you can buy is ₦5,000",
            size: 12,
            color: Color(0xff475467),
          ),
          const VSpace(40),
          Button(
            text: "Next",
            onTap: () => AppRouter.instance.navigateTo(
              UnitPaymentReceiptView.routeName,
            ),
          ),
          const VSpace(30),
        ],
      ),
    );
  }
}

