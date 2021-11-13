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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: _size.height * 0.08,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: viewModel.foodTag,
                    child: Image.asset(viewModel.foodImagePath),
                  ),
                ),
                Text(
                  viewModel.foodName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 24.0),
                )
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => ItemDetailPageViewModel(),
    );
  }
}
