import 'package:bloc_test/screens/detail.dart';
import 'package:bloc_test/screens/home.dart';
import 'package:bloc_test/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static Route routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return navigatePage(HomeScreen());
      case detailScreen:
        return navigatePage(const DetailScreen());
      default:
        return navigatePage(HomeScreen());
    }
  }
}

navigatePage(Widget screen) => CupertinoPageRoute(builder: (context) => screen);
