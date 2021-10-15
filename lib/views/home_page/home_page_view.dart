import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_page_view_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      builder: (BuildContext context, HomePageViewModel viewModel, _) {
        return Scaffold(
          body: Center(
            child: Text('HomePage View'),
          ),
        );
      },
      viewModelBuilder: () => HomePageViewModel(),
    );
  }
}
