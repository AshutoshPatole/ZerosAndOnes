import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import '../../core/constants/drawer_enum.dart';
import '../../core/logger.dart';
import '../feedback_page/feedback_page_view.dart';
import '../home_page/home_page_view.dart';

class NavigationViewModel extends BaseViewModel {
  late Logger log;

  NavigationViewModel() {
    log = getLogger(runtimeType.toString());
  }
  Widget? screenView;
  DrawerIndex? drawerIndex;

  void changeScreenView(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.home) {
        screenView = HomePageView();
      } else if (drawerIndex == DrawerIndex.feedback) {
        screenView = const FeedbackPageView();
      } else {
        // error screen
      }
    }
    notifyListeners();
  }
}
