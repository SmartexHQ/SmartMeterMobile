import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/box/box_widget.dart';
import 'package:smartmetermobile/cores/components/custom_scaffold_widget.dart';
import 'package:smartmetermobile/cores/components/custom_text_widget.dart';
import 'package:smartmetermobile/cores/components/image_widget.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const TextWidget.bold("Settings", size: 32, color: Color(0xff344054)),
        const VSpace(25),
        BoxWidget(
          Row(children: [
            CircleAvatar(radius: w(20)),
            const HSpace(8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget.bold(
                  "Odinchinma Promise",
                  size: 14,
                  color: Color(0xff344054),
                ),
                VSpace(4),
                TextWidget("Total Meter: 16", size: 12)
              ],
            ),
          ]),
          padding: EdgeInsets.all(w(16)),
          color: const Color(0xffEFF8FF),
          borderColor: const Color(0xffEFF8FF),
        ),
        const VSpace(40),
        _optionWidget("Personal Information", "person.svg"),
        const VSpace(16),
        _optionWidget("Change Language", 'doc.svg'),
        const VSpace(16),
        _optionWidget("Change Password", 'key.svg'),
        const VSpace(16),
        _optionWidget("Lodge a Complaint", 'people.svg'),
        const VSpace(16),
        _optionWidget(
          "Login with Fingerprint",
          'thumb.svg',
          action: Transform.scale(
            scale: 0.7,
            child: Switch(
              padding: EdgeInsets.zero,
              value: true,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (_) {},
            ),
          ),
        ),
      ]),
    );
  }

  Widget _optionWidget(String title, String img, {Widget? action}) {
    return BoxWidget(
      Row(children: [
        Container(
          padding: EdgeInsets.all(w(4)),
          decoration: const BoxDecoration(
            color: Color(0xffD0D5DD),
            shape: BoxShape.circle,
          ),
          child: ImageWidget(
            imageTypes: ImageTypes.svg,
            imageUrl: "assets/icon/$img",
            height: h(18),
            width: w(18),
          ),
        ),
        const HSpace(8),
        TextWidget(title, size: 14, color: const Color(0xff344054)),
        const Spacer(),
        action ??
            const Icon(
              Icons.keyboard_arrow_right,
              color: Color(0xff344054),
              size: 18,
            ),
      ]),
      color: const Color(0xffF2F4F7),
      borderColor: const Color(0xffF2F4F7),
    );
  }
}
