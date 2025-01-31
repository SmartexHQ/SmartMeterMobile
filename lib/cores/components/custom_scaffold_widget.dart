import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/locator.dart';
import '../constants/constants.dart';
import '../shared_features/loading_overlay/bloc/loading_over_lay_bloc.dart';
import '../utils/sizer_utils.dart';

class ScaffoldWidget extends StatelessWidget {
  ScaffoldWidget({
    super.key,
    required this.body,
    this.appBar,
    this.usePadding = true,
    this.useSingleScroll = true,
    this.bg,
    this.scaffoldKey,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.scrollController,
    this.topSafeArea = true,
    this.useBottomPadding = false,
    this.useBgImage = false,
  });

  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool usePadding;
  final bool useSingleScroll;
  final Color? bg;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final ScrollController? scrollController;
  final bool topSafeArea;
  final bool useBottomPadding;
  final bool useBgImage;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      context.isDarkMode == false
          ? SystemUiOverlayStyle.light.copyWith(
              systemNavigationBarIconBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
            )
          : SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.black,
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
    );

    final EdgeInsets edgeInsets = EdgeInsets.symmetric(
      horizontal: usePadding ? sp(kGlobalPadding) : 0,
    ).copyWith(bottom: h(useBottomPadding ? 16 : 0));

    return SizedBox(
      height: sh(100),
      child: Stack(children: [
        Scaffold(
          drawerEnableOpenDragGesture: true,
          key: scaffoldKey,
          appBar: appBar,
          backgroundColor: bg ?? Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            top: topSafeArea,
            child: SizedBox(
              height: sh(100),
              child: useSingleScroll
                  ? SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: scrollController,
                      child: Padding(padding: edgeInsets, child: body),
                    )
                  : Padding(padding: edgeInsets, child: body),
            ),
          ),
          drawer: drawer,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
        ),
      ]),
    );
  }
}
