import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/models/mock_data.dart';
import 'package:zerosandones/core/models/user_location.dart';
import 'package:zerosandones/theme/app_theme.dart';
import 'package:zerosandones/widgets/dumb_widgets/getting_location.dart';
import 'package:zerosandones/widgets/dumb_widgets/not_serviceable_location.dart';
import 'package:zerosandones/widgets/smart_widgets/coupon.dart';
import 'package:zerosandones/widgets/smart_widgets/home_header.dart';
import 'home_page_view_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    ? const GetLocationCircularProgressIndicator()
                    : viewModel.isServiceableDistance
                        ? SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HomeHeader(address: viewModel.address),
                                  SizedBox(
                                    height: size.height * 0.05,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // TODO : Open a page with terms and condition for the coupon code.
                                    },
                                    child: const Coupon(),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.05,
                                  ),
                                  const Text(
                                    "Categories",
                                    style: AppTheme.title,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.25,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: mockFood.length,
                                      itemBuilder: (context, index) {
                                        final data = mockFood[index];
                                        return GestureDetector(
                                          onTap: () {
                                            viewModel.setFoodHolderProps(
                                                foodImagePath: data.imageLink,
                                                foodName: data.name,
                                                foodTag:
                                                    '${mockFood[index].imageLink}-$index,');
                                            viewModel.navigateItemDetailPage();
                                          },
                                          child: Container(
                                            width: size.width * 0.35,
                                            height: size.height * 0.1,
                                            margin: const EdgeInsets.all(10),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: AppTheme.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppTheme.primaryColor
                                                      .withOpacity(0.75),
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                  offset: const Offset(2, 4.5),
                                                )
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: size.height * 0.025,
                                                ),
                                                Hero(
                                                  tag:
                                                      '${mockFood[index].imageLink}-$index,',
                                                  child: Image.asset(
                                                    data.imageLink,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  data.name,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
