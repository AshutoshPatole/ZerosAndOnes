import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../core/constants/drawer_enum.dart';
import '../drawer_page/drawer_page_view.dart';
import '../home_page/home_page_view.dart';
import 'navigation_view_model.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NavigationViewModel>.reactive(
      onModelReady: (model) {
        model.drawerIndex = DrawerIndex.home;
        model.screenView = HomePageView();
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
