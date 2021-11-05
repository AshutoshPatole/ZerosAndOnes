import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'item_detail_page_view_model.dart';

class ItemDetailPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ItemDetailPageViewModel>.reactive(
      builder: (BuildContext context, ItemDetailPageViewModel viewModel, _) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Hero(
              tag: "tag",
              child: Image.asset("name"),
            ),
          ),
        );
      },
      viewModelBuilder: () => ItemDetailPageViewModel(),
    );
  }
}
