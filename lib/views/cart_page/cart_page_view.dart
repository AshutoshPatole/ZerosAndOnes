import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/models/cart_items.dart';
import 'package:zerosandones/theme/app_theme.dart';

import 'cart_page_view_model.dart';

class CartPageView extends StatelessWidget {
  CartPageView({Key? key}) : super(key: key);

  Stream<List<CartItem>>? _stream;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
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
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.arrow_left,
                        )),
                    SizedBox(
                      width: _size.width * 0.3,
                    ),
                    const Text(
                      "Cart",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
                StreamBuilder(
                  stream: _stream,
                  builder: (context, AsyncSnapshot<List<CartItem>> snapshot) {
                    return snapshot.data?.length == 0
                        ? const Center(
                            child: Text("No Item"),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final data = snapshot.data![index];
                              return Slidable(
                                key: const ValueKey(0),
                                endActionPane: ActionPane(
                                  extentRatio: 0.3,
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      autoClose: true,
                                      backgroundColor: const Color(0xFFFE4A49),
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                      onPressed: (BuildContext context) {},
                                    ),
                                  ],
                                ),
                                child: Container(
                                  height: _size.height * 0.2,
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        offset: const Offset(1, 4),
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        data.itemPhoto,
                                        width: _size.width * 0.3,
                                        height: _size.height * 0.2,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            data.itemName,
                                            style: const TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            height: _size.height * 0.01,
                                          ),
                                          Text(
                                            " ₹ ${data.price}",
                                            style: const TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              viewModel.incOrDec(
                                                itemId: data.itemId,
                                                increment: false,
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            data.quantity.toString(),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              viewModel.incOrDec(
                                                itemId: data.itemId,
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.add_circle_outline,
                                              color: AppTheme.primaryColor,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: snapshot.data?.length ?? 0,
                          );
                  },
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
