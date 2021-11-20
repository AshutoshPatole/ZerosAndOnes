import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/models/item.dart';
import 'package:zerosandones/core/models/mock_data.dart';
import 'package:zerosandones/core/models/user_location.dart';
import 'package:zerosandones/theme/app_theme.dart';
import 'package:zerosandones/widgets/dumb_widgets/getting_location.dart';
import 'package:zerosandones/widgets/dumb_widgets/not_serviceable_location.dart';
import 'package:zerosandones/widgets/dumb_widgets/sliver_sized_box.dart';
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
        model.getData();
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
                    : Column(
                        children: [
                          HomeHeader(address: viewModel.address),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: CustomScrollView(
                                physics: const BouncingScrollPhysics(),
                                slivers: [
                                  SliverSizedBox(size: size.height * 0.01),
                                  SliverToBoxAdapter(
                                    child: viewModel.isServiceableDistance
                                        ? SizedBox(
                                            height: size.height * 0.05,
                                          )
                                        : const NotServiceableLocation(),
                                  ),
                                  SliverToBoxAdapter(
                                    child: GestureDetector(
                                      onTap: () {
                                        // TODO : Open a page with terms and condition for the coupon code.
                                      },
                                      child: const Coupon(),
                                    ),
                                  ),
                                  SliverSizedBox(size: size.height * 0.04),
                                  const SliverToBoxAdapter(
                                    child: Text(
                                      "Categories",
                                      style: AppTheme.title,
                                    ),
                                  ),
                                  StreamBuilder(
                                    stream: viewModel.getData(),
                                    builder: (context,
                                        AsyncSnapshot<List<Item>> snapshot) {
                                      return SliverGrid(
                                        delegate: SliverChildBuilderDelegate(
                                          (context, index) {
                                            final data = snapshot.data![index];
                                            return Container(
                                              height: size.height * 0.2,
                                              margin: const EdgeInsets.all(8),
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
                                                    offset:
                                                        const Offset(2, 4.5),
                                                  )
                                                ],
                                              ),
                                              child: GestureDetector(
                                                onTap: () {
                                                  viewModel.setFoodHolderProps(
                                                    foodImagePath: data.photo,
                                                    foodName: data.name,
                                                    foodTag:
                                                        '${data.photo}-$index,',
                                                    foodPrice: data.price,
                                                    foodRating:
                                                        data.rating.toString(),
                                                    ingredients:
                                                        data.ingredients,
                                                    description:
                                                        data.description,
                                                  );
                                                  viewModel
                                                      .navigateItemDetailPage();
                                                },
                                                child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: size.height *
                                                              0.03,
                                                        ),
                                                        Hero(
                                                          tag:
                                                              '${mockFood[index].imageLink}-$index,',
                                                          child: Image.network(
                                                            data.photo,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: size.height *
                                                              0.025,
                                                        ),
                                                        Text(
                                                          data.name,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16.0,
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              const Icon(
                                                                CupertinoIcons
                                                                    .heart,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              Text(
                                                                data.rating
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      18.0,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Positioned(
                                                      right:
                                                          -size.width * 0.0285,
                                                      top: -size.height * 0.015,
                                                      child: Container(
                                                        width:
                                                            size.width * 0.15,
                                                        height:
                                                            size.height * 0.05,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white
                                                              .withOpacity(0.6),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topRight:
                                                                Radius.circular(
                                                                    20.0),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20.0),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "₹ ${data.price}",
                                                            style:
                                                                const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          childCount:
                                              snapshot.data?.length ?? 0,
                                        ),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.7,
                                          mainAxisSpacing: 10,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
              },
            ),
          ),
        );
      },
      viewModelBuilder: () => HomePageViewModel(),
    );
  }
}
