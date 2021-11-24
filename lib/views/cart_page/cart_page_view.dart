import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/models/cart_items.dart';

import 'cart_page_view_model.dart';

class CartPageView extends StatelessWidget {
  CartPageView({Key? key}) : super(key: key);

  Stream<List<CartItem>>? _stream;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartPageViewModel>.reactive(
      onModelReady: (model) {
        _stream = model.getCartItems();
      },
      builder: (BuildContext context, CartPageViewModel viewModel, _) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your Cart",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: _stream,
                    builder: (context, AsyncSnapshot<List<CartItem>> snapshot) {
                      return /* snapshot.data?.length == 0
                          ? const Center(
                              child: Text("No Item"),
                            )
                          : */
                          ListView.builder(
                        itemBuilder: (context, index) {
                          final data = snapshot.data![index];

                          return Container();
                        },
                        itemCount: snapshot.data?.length ?? 0,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => CartPageViewModel(),
    );
  }
}
