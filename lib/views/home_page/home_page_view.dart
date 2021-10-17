import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/models/user_location.dart';
import 'package:zerosandones/widgets/dumb_widgets/not_serviceable_location.dart';
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
                              Container(
                                width: double.infinity,
                                height: 60,
                                color: Colors.transparent,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        CupertinoIcons.location_solid,
                                        size: 20,
                                        color: Colors.red,
                                      ),
                                      Text(viewModel.address),
                                    ],
                                  ),
                                ),
                              ),
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
