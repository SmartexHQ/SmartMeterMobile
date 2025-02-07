import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/constants/constants.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(children: [
        header(),
        const VSpace(24),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _itemWidget(
            title: "Total Units",
            value: "70.40/KWh",
            image: "assets/icon/buy_unit.svg",
            main: const Color(0xffC1AA00),
            bg: const Color(0xffE3C900).withOpacity(0.2),
          ),
          _itemWidget(
            title: "Total Meter",
            value: "40",
            image: "assets/icon/meter.svg",
            main: const Color(0xff2E90FA),
            bg: const Color(0xff2E90FA).withOpacity(0.2),
          ),
        ]),
        const VSpace(18),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _itemWidget(
            title: "Active Meter",
            value: "35",
            image: "assets/icon/dot.svg",
            main: const Color(0xff20C322),
            bg: const Color(0xff20C322).withOpacity(0.2),
          ),
          _itemWidget(
            title: "Inactive Meter",
            value: "05",
            image: "assets/icon/dot.svg",
            main: const Color(0xffFF0D00),
            bg: const Color(0xffFF0D00).withOpacity(0.2),
          ),
        ]),
        const VSpace(16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(16)),
          decoration: BoxDecoration(
            color: const Color(0xffD1E9FF),
            borderRadius: BorderRadius.circular(sr(8)),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      "Recharge your meter and enjoy seamless, uninterrupted power supply",
                      color: Color(0xff1570EF),
                    ),
                    const VSpace(12),
                    Button.smallSized(
                      height: h(40),
                      width: w(105),
                      text: "Buy Now",
                      textSize: sp(14),
                      textColor: kcWhite,
                      textFontWeight: FontWeight.w700,
                    )
                  ]),
            ),
            const HSpace(15),
            const ImageWidget(
              imageTypes: ImageTypes.svg,
              imageUrl: "assets/icon/strick.svg",
            )
          ]),
        ),
      ]),
    );
  }

  Widget _itemWidget({
    required String title,
    required String value,
    required String image,
    required Color main,
    required Color bg,
  }) {
    return Container(
      width: sw(42),
      padding: EdgeInsets.all(w(10)),
      decoration: BoxDecoration(
        color: const Color(0xffF2F4F7),
        borderRadius: BorderRadius.circular(sr(8)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(
            height: h(40),
            width: h(40),
            padding: EdgeInsets.symmetric(vertical: h(8), horizontal: w(8)),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(sr(8)),
            ),
            child: ImageWidget(
              imageTypes: ImageTypes.svg,
              imageUrl: image,
              useIconColor: true,
              color: main,
            ),
          ),
          const HSpace(8),
          TextWidget.bold(title, size: 14),
        ]),
        const VSpace(12),
        TextWidget.bold(value, size: 18),
      ]),
    );
  }

  Row header() {
    return Row(children: [
      CircleAvatar(radius: w(20)),
      const HSpace(8),
      const TextWidget.semibold(
        "Hello, Odinchinma",
        size: 14,
        withOpacity: .7,
      ),
      const Spacer(),
      const ImageWidget(
        imageTypes: ImageTypes.svg,
        imageUrl: "assets/icon/noti.svg",
      )
    ]);
  }
}
