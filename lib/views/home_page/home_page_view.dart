import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/models/mock_data.dart';
import 'package:zerosandones/core/models/user_location.dart';
import 'package:zerosandones/theme/app_theme.dart';
import 'package:zerosandones/widgets/dumb_widgets/not_serviceable_location.dart';
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
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
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
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: size.width,
                                        height: size.height * 0.2,
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: AppTheme.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppTheme.primaryColor
                                                  .withOpacity(0.75),
                                              spreadRadius: 0,
                                              blurRadius: 5,
                                              offset: const Offset(2, 4),
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "25% Off",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Apply APPSPL25 coupon",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        right: size.width * 0.05,
                                        top: size.height * 0.05,
                                        child: Container(
                                          width: size.width * 0.4,
                                          height: size.height * 0.4,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.white.withOpacity(0.2),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: size.width * 0.05,
                                        bottom: size.height * 0.05,
                                        child: Container(
                                          width: size.width * 0.4,
                                          height: size.height * 0.4,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.white.withOpacity(0.2),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: -50,
                                        top: -65,
                                        child: Image.asset(
                                          'assets/images/nice.png',
                                          width: 200,
                                          height: 200,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.05,
                                  ),
                                  const Text(
                                    "Categories",
                                    style: AppTheme.title,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.3,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: mockFood.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: size.width * 0.3,
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
                                              Image.asset(
                                                  mockFood[index].imageLink),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Text(mockFood[index].name),
                                              Container(
                                                width: size.width * 0.08,
                                                height: size.height * 0.08,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                ),
                                                child: const Icon(
                                                  CupertinoIcons.right_chevron,
                                                  color: Colors.black,
                                                  size: 16,
                                                ),
                                              )
                                            ],
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
