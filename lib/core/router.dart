// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:zerosandones/core/router_constants.dart';

import 'package:zerosandones/views/login_page/login_page_view.dart' as view0;
import 'package:zerosandones/views/drawer_page/drawer_page_view.dart' as view1;
import 'package:zerosandones/views/navigation/navigation_view.dart' as view2;
import 'package:zerosandones/views/home_page/home_page_view.dart' as view3;
import 'package:zerosandones/views/feedback_page/feedback_page_view.dart'
    as view4;
import 'package:zerosandones/views/item_detail_page/item_detail_page_view.dart'
    as view5;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPageViewRoute:
        return MaterialPageRoute(builder: (_) => const view0.LoginPageView());
      case drawerPageViewRoute:
        return MaterialPageRoute(builder: (_) => const view1.DrawerPageView());
      case navigationViewRoute:
        return MaterialPageRoute(builder: (_) => const view2.NavigationView());
      case homePageViewRoute:
        return MaterialPageRoute(builder: (_) => const view3.HomePageView());
      case feedbackPageViewRoute:
        return MaterialPageRoute(
            builder: (_) => const view4.FeedbackPageView());
      case itemDetailPageViewRoute:
        return MaterialPageRoute(
            builder: (_) => const view5.ItemDetailPageView());
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
