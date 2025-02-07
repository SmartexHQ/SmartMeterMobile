import 'package:flutter/material.dart';
import 'package:smartmetermobile/cores/components/image_widget.dart';
import 'package:smartmetermobile/cores/constants/constants.dart';
import 'package:smartmetermobile/cores/utils/sizer_utils.dart';
import 'package:smartmetermobile/features/home/presentation/view/home_view.dart';

class HomeTabView extends StatefulWidget {
  static const String routeName = "/home_tab_view";
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  int _index = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    Center(child: Text('Search Page')),
    Center(child: Text('Add Page')),
    Center(child: Text('Notifications Page')),
    Center(child: Text('Profile Page')),
  ];

  void _onItemTapped(int index) {
    setState(() => _index = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _widgetOptions),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          bottomBarItem("Home", "home.svg", selected: _index == 0),
          bottomBarItem("Meter", "meter.svg", selected: _index == 1),
          bottomBarItem("Buy Unit", "buy_unit.svg", selected: _index == 2),
          bottomBarItem("Payment", "pay.svg", selected: _index == 3),
          bottomBarItem("Settings", "setting.svg", selected: _index == 4),
        ],
        currentIndex: _index,
        selectedItemColor: kcPrimaryColor,
        unselectedItemColor: const Color(0xff667085),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  bottomBarItem(String lable, String img, {bool selected = false}) {
    return BottomNavigationBarItem(
      label: lable,
      icon: ImageWidget(
        imageTypes: ImageTypes.svg,
        imageUrl: "assets/icon/$img",
        height: h(24),
        width: w(24),
        useIconColor: true,
        color: selected ? kcPrimaryColor : const Color(0xff667085),
      ),
    );
  }
}
