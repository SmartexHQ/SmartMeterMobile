import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartmetermobile/app/env.dart';
import 'package:smartmetermobile/features/auth/presentation/views/intro/intro_screen.dart';

import '../cores/constants/color.dart';
import '../cores/navigator/app_navigation_observer.dart';
import '../cores/navigator/app_router.dart';
import '../cores/navigator/router_generator.dart';
import 'locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final AppNavObserver _appNavObserver = getIt<AppNavObserver>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, Widget? child) {
        return MaterialApp(
          title: 'Smart Meter',
          theme: ThemeClass.lightTheme,
          initialRoute: IntroScreen.routeName,
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: AppRouter.instance.navigatorKey,
          debugShowCheckedModeBanner:
              getIt<ENV>().enviroment == Enviroment.staging,
          navigatorObservers: [_appNavObserver],
        );
      },
    );
  }
}
