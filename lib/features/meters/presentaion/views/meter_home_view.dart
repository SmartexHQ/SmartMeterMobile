import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/box/box_widget.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/constants/color.dart';
import 'package:smartmetermobile/cores/navigator/navigator.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';
import 'package:smartmetermobile/features/meters/presentaion/views/meter_info_view.dart';
import 'package:smartmetermobile/features/shared/widget/search_widget.dart';

class MeterHomeView extends StatelessWidget {
  const MeterHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: AppBar(
        title: const TextWidget.bold("Meters", size: 32, withOpacity: 0.8),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        leadingWidth: 0,
        leading: const SizedBox(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _headerAction("Request New Meter"),
            _headerAction("Meter Requests History"),
          ]),
          const VSpace(24),
          const SharedSearchWidget(),
          const VSpace(24),
          const TextWidget.semibold("Meter List", color: Color(0xff344054)),
          const VSpace(20),
          Flexible(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 15,
              separatorBuilder: (context, index) => const VSpace(16),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => AppRouter.instance.navigateTo(
                  MeterInfoView.routeName,
                ),
                child: _itemWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemWidget() {
    const textColor = Color(0xff344054);
    const size = 12.0;

    return BoxWidget(
      Column(children: [
        Row(children: [
          SizedBox.square(
            dimension: w(16),
            child: const ImageWidget(
              imageTypes: ImageTypes.svg,
              imageUrl: "assets/icon/meter.svg",
              color: kcPrimaryColor,
              useIconColor: true,
            ),
          ),
          const HSpace(6),
          const TextWidget.bold(
            "Yaba Flat Room 3",
            size: size,
            color: textColor,
          ),
          const Spacer(),
          SizedBox.square(
            dimension: w(16),
            child: const ImageWidget(
              imageTypes: ImageTypes.svg,
              imageUrl: "assets/icon/strick.svg",
              color: kcPrimaryColor,
              useIconColor: true,
            ),
          ),
          const HSpace(4),
          const TextWidget.bold("51.23 kWh", size: size, color: textColor),
        ]),
        const VSpace(16),
        const Row(children: [
          TextWidget("58101245502", size: size, color: textColor),
          Spacer(),
          TextWidget("Active", size: size, color: textColor),
        ])
      ]),
    );
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
}
