import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_page_view_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      onModelReady: (model) {
        model.getCurrentLocation(context);
      },
      builder: (BuildContext context, HomePageViewModel viewModel, _) {
        return Scaffold();
      },
      viewModelBuilder: () => HomePageViewModel(),
    );
  }
}
