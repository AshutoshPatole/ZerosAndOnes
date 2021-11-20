import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: _size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(CupertinoIcons.arrow_left),
                        Icon(CupertinoIcons.heart),
                      ],
                    ),
                    SizedBox(
                      height: _size.height * 0.05,
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
                      height: _size.height * 0.02,
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
                    const Text(
                      "Ingredients",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    )
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
