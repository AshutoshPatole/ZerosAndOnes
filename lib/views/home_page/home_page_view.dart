import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/models/user_location.dart';
import 'package:zerosandones/theme/app_theme.dart';
import 'package:zerosandones/widgets/dumb_widgets/not_serviceable_location.dart';
import 'package:zerosandones/widgets/smart_widgets/home_header.dart';
import 'home_page_view_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      onModelReady: (model) {
        // model.getCurrentLocation();
        model.startLocation();
        model.getAddress();
      },
      builder: (BuildContext context, HomePageViewModel viewModel, _) {
        return Scaffold(
          body: SafeArea(
            child: StreamBuilder<UserLocation>(
              stream: viewModel.locationStream,
              builder: (context, snapshot) {
                return viewModel.serviceableDistance < 0
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : viewModel.isServiceableDistance
                        ? Column(
                            children: [
                              HomeHeader(address: viewModel.address),
                            ],
                          )
                        : const NotServiceableLocation();
              },
            ),
          ),
        );
      },
      viewModelBuilder: () => HomePageViewModel(),
    );
  }
}
