// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:zerosandones/core/router_constants.dart';

import 'package:zerosandones/views/home_page/home_page_view.dart' as view0;
import 'package:zerosandones/views/login_page/login_page_view.dart' as view1;
import 'package:zerosandones/views/home_page/home_page_view.dart' as view2;
import 'package:zerosandones/views/drawer_page/drawer_page_view.dart' as view3;
import 'package:zerosandones/views/home_page/home_page_view.dart' as view4;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageViewRoute:
        return MaterialPageRoute(builder: (_) => view0.HomePageView());
      case loginPageViewRoute:
        return MaterialPageRoute(builder: (_) => view1.LoginPageView());
      case homePageViewRoute0:
        return MaterialPageRoute(builder: (_) => view2.HomePageView());
      case drawerPageViewRoute:
        return MaterialPageRoute(builder: (_) => view3.DrawerPageView());
      case homePageViewRoute1:
        return MaterialPageRoute(builder: (_) => view4.HomePageView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}