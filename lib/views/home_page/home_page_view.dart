import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/widgets/dumb_widgets/shimmer_home.dart';
import '../../core/models/item.dart';
import '../../core/models/user_location.dart';
import '../../theme/app_theme.dart';
import '../../widgets/dumb_widgets/getting_location.dart';
import '../../widgets/dumb_widgets/not_serviceable_location.dart';
import '../../widgets/dumb_widgets/sliver_sized_box.dart';
import '../../widgets/smart_widgets/coupon.dart';
import '../../widgets/smart_widgets/home_header.dart';
import '../../widgets/smart_widgets/sliver_food_container.dart';
import 'home_page_view_model.dart';

class HomePageView extends StatelessWidget {
  HomePageView({Key? key}) : super(key: key);

  Stream<List<Item>>? _stream;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ViewModelBuilder<HomePageViewModel>.reactive(
      onModelReady: (model) {
        _stream = model.getData();
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
                                    stream: _stream,
                                    builder: (context,
                                        AsyncSnapshot<List<Item>> snapshot) {
                                      if (!snapshot.hasData) {
                                        return const ItemShimmer();
                                      }
                                      return SliverFoodContainers(
                                        snapshot: snapshot,
                                        viewModel: viewModel,
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
