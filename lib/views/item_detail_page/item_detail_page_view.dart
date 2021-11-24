import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../theme/app_theme.dart';
import 'item_detail_page_view_model.dart';

class ItemDetailPageView extends StatelessWidget {
  const ItemDetailPageView({Key? key}) : super(key: key);
  // final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return ViewModelBuilder<ItemDetailPageViewModel>.reactive(
      builder: (BuildContext context, ItemDetailPageViewModel viewModel, _) {
        return Scaffold(
          // key: _scaffoldState,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: _size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            viewModel.navigateBack();
                          },
                          icon: const Icon(CupertinoIcons.arrow_left),
                        ),
                        const Icon(CupertinoIcons.heart),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _size.height * 0.02,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      viewModel.foodName,
                      style: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _size.height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: viewModel.foodTag,
                      child: Image.network(viewModel.foodImagePath),
                    ),
                  ),
                  SizedBox(
                    height: _size.height * 0.02,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "Ingredients",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _size.height * 0.02,
                  ),
                  SizedBox(
                    height: _size.height * 0.2,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: viewModel.ingredients.length,
                      itemBuilder: (context, index) {
                        final data = viewModel.ingredients[index];
                        return Container(
                          width: _size.width * 0.24,
                          height: _size.height * 0.1,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: _size.height * 0.02,
                              ),
                              Text(
                                data.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                              SizedBox(
                                height: _size.height * 0.01,
                              ),
                              Text(
                                data.grams,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffe0e0e0),
                                  fontSize: 13.0,
                                ),
                              ),
                              SizedBox(
                                height: _size.height * 0.01,
                              ),
                              Container(
                                width: _size.width * 0.18,
                                height: _size.height * 0.09,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    data.percentage,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: _size.height * 0.02,
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                    child: Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      viewModel.description,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _size.height * 0.07,
                  ),
                  Container(
                    height: _size.height * 0.125,
                    width: _size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.0),
                        topLeft: Radius.circular(25.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹ ${viewModel.foodPrice}",
                          style: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () async {
                            bool? result = await viewModel.userService
                                .addItemToCart(
                                    itemId: viewModel.foodId,
                                    itemPhoto: viewModel.foodImagePath,
                                    price: viewModel.foodPrice,
                                    quantity: "1",
                                    itemName: viewModel.foodName);
                            print(result);
                            if (result == true) {
                              // ! TODO : Fix E/flutter (14427): Typically, the Scaffold widget is introduced by the MaterialApp or WidgetsApp widget at the top of your application widget tree.
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Added")));
                              // Builder(builder: (BuildContext context) {
                              //   return MotionToast.success(
                              //     title: "👍",
                              //     titleStyle: const TextStyle(
                              //         fontWeight: FontWeight.bold),
                              //     description: "Item Added",
                              //     descriptionStyle:
                              //         const TextStyle(fontSize: 12),
                              //     layoutOrientation: ORIENTATION.RTL,
                              //     animationType: ANIMATION.FROM_RIGHT,
                              //     width: 300,
                              //   ).show(context);
                              // });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("You need to sign In")));
                              // _displayWarningMotionToast(context);
                              // Builder(
                              //   builder: (BuildContext context) {
                              //     return MotionToast.error(
                              //       iconType: ICON_TYPE.CUPERTINO,
                              //       titleStyle: const TextStyle(
                              //           fontWeight: FontWeight.bold),
                              //       description: "Item not added",
                              //       descriptionStyle:
                              //           const TextStyle(fontSize: 12),
                              //       layoutOrientation: ORIENTATION.RTL,
                              //       animationType: ANIMATION.FROM_RIGHT,
                              //       width: 300,
                              //     ).show(context);
                              //   },
                              // );
                            }
                          },
                          child: Container(
                            width: _size.width * 0.4,
                            height: _size.height * 0.075,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: const Center(
                              child: Text("Add to Cart"),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => ItemDetailPageViewModel(),
    );
  }

  _displayWarningMotionToast(BuildContext context) {
    MotionToast.warning(
      title: "Warning Motion Toast",
      titleStyle: TextStyle(fontWeight: FontWeight.bold),
      description: "This is a Warning",
      animationCurve: Curves.bounceIn,
      borderRadius: 0,
      animationDuration: Duration(milliseconds: 1000),
    ).show(context);
  }
}
