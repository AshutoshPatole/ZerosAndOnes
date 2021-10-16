import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/models/user_location.dart';
import 'home_page_view_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      onModelReady: (model) {
        // model.getCurrentLocation();
      },
      builder: (BuildContext context, HomePageViewModel viewModel, _) {
        return Scaffold(
          body: StreamBuilder<UserLocation>(
            stream: viewModel.locationStream,
            builder: (context, snapshot) {
              return Center(
                child: Text(
                    'Location: Lat${snapshot.data?.latitude}, Long: ${snapshot.data?.longitude}'),
              );
            },
          ),
        );
      },
      viewModelBuilder: () => HomePageViewModel(),
    );
  }
}
