import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/constants/drawer_enum.dart';
import 'package:zerosandones/views/drawer_page/drawer_page_view.dart';
import 'package:zerosandones/views/home_page/home_page_view.dart';
import 'navigation_view_model.dart';

class NavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NavigationViewModel>.reactive(
      onModelReady: (model) {
        model.drawerIndex = DrawerIndex.home;
        model.screenView = const HomePageView();
      },
      builder: (BuildContext context, NavigationViewModel viewModel, _) {
        return Scaffold(
          body: DrawerPageView(
            onDrawerCall: (DrawerIndex index) {
              // call change view here
              viewModel.changeScreenView(index);
            },
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            screenIndex: viewModel.drawerIndex,
            screenView: viewModel.screenView,
          ),
        );
      },
      viewModelBuilder: () => NavigationViewModel(),
    );
  }
}
