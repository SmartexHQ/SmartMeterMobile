import 'package:flutter/cupertino.dart';
import 'package:smartmetermobile/cores/components/components.dart';
import 'package:smartmetermobile/cores/utils/utils.dart';

class SharedSearchWidget extends StatelessWidget {
  const SharedSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Flexible(
        child: CupertinoSearchTextField(
          placeholder: "Search by meter number",
          placeholderStyle: TextStyle(
            color: const Color(0xff98A2B3),
            fontSize: sp(14),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: h(6)),
            child: const Icon(CupertinoIcons.search),
          ),
          onChanged: (_) {},
          padding: EdgeInsets.symmetric(horizontal: w(6), vertical: h(11)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(sr(8)),
            border: Border.all(color: const Color(0xffD0D5DD)),
          ),
        ),
      ),
      const HSpace(16),
      ImageWidget(
        imageTypes: ImageTypes.svg,
        imageUrl: "assets/icon/download.svg",
        height: h(40),
        width: w(40),
      ),
    ]);
  }
}
