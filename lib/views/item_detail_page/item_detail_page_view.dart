import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/theme/app_theme.dart';
import 'item_detail_page_view_model.dart';

class ItemDetailPageView extends StatelessWidget {
  const ItemDetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<ItemDetailPageViewModel>.reactive(
      builder: (BuildContext context, ItemDetailPageViewModel viewModel, _) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                        children: const [
                          Icon(CupertinoIcons.arrow_left),
                          Icon(CupertinoIcons.heart),
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
                        child: Image.asset(viewModel.foodImagePath),
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
                                  height: _size.height * 0.01,
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
                                  height: _size.height * 0.02,
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => ItemDetailPageViewModel(),
    );
  }
}
