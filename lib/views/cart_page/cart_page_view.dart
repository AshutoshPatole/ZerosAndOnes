import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'cart_page_view_model.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartPageViewModel>.reactive(
      builder: (BuildContext context, CartPageViewModel viewModel, _) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: const [
                Text(
                  "Your Cart",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => CartPageViewModel(),
    );
  }
}
