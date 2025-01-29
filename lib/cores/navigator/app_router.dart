import 'package:flutter/material.dart';

class RouteListData {
  final String route;
  final bool replaceRoute;
  final bool clearRoute;

  const RouteListData({
    required this.route,
    this.clearRoute = false,
    this.replaceRoute = false,
  }) : assert(
          !(clearRoute == true && replaceRoute == true),
          "'clearRoute' and 'replaceRoute' cannot be both true",
        );
}

class AppRouter {
  AppRouter._internal();

  static final AppRouter instance = AppRouter._internal();

  factory AppRouter() => instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final List<RouteListData> _route = <RouteListData>[];

  void addRoute(
    String route, {
    bool clearRoute = false,
    bool replaceRoute = false,
  }) {
    final routeData = RouteListData(
      route: route,
      clearRoute: clearRoute,
      replaceRoute: replaceRoute,
    );
    _route.add(routeData);
  }

  void addRoutes(List<RouteListData> routes) {
    _route.addAll(routes);
  }

  void clearRoutes() => _route.clear();

  bool shouldShowLoginOnLogOut = true;

  // Hack: Improve Later
  DateTime lastLogoutTimestamp = DateTime.now();

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> navigate(Widget page) {
    return navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Future<dynamic> navigateToAndReplace(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> navigateToAndReplacePage(Widget page) {
    return navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Future<dynamic> clearRouteAndPush(String routeName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName('/'),
    );
  }

  void popUntil(String routeName) {
    return navigatorKey.currentState!.popUntil(
      ModalRoute.withName(routeName),
    );
  }

  void goBack([dynamic result]) {
    return navigatorKey.currentState!.pop(result);
  }

  Future<bool> maybePop([dynamic result]) async {
    return await navigatorKey.currentState!.maybePop();
  }

  bool hasRoutes() => _route.isNotEmpty;

  Future<dynamic> moveToNextRoute() {
    try {
      final routeData = _route.removeAt(0);
      // if (_route.isNotEmpty) {
      //   return clearRouteAndPush(routeName);
      // }

      if (routeData.replaceRoute) {
        return navigateToAndReplace(routeData.route);
      } else if (routeData.clearRoute) {
        return clearRouteAndPush(routeData.route);
      }

      return navigateTo(routeData.route);
    } catch (e) {
      return navigateTo('/error');
    }
  }

  Future<void> logOut() async {
    final DateTime now = DateTime.now();

    final int difference = now.difference(lastLogoutTimestamp).inSeconds;
    if (difference < 1) return;

    if (!shouldShowLoginOnLogOut) return;
    lastLogoutTimestamp = DateTime.now();
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(
      "/login",
      ModalRoute.withName('/login'),
    );
  }

  bool canGoBack() => navigatorKey.currentState!.canPop();
}
