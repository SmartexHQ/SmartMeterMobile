import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/app_bar_widget.dart';
import 'package:smartmetermobile/cores/components/custom_scaffold_widget.dart';

class PaymentReceiptView extends StatelessWidget {
  static const String routeName = '/payment-receipt';
  const PaymentReceiptView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWidget(
      appBar: CustomAppBar(title: "Edit Meter Name"),
      body: Column(children: []),
    );
  }
}
