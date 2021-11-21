import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/models/item.dart';
import '../../theme/app_theme.dart';
import '../../views/home_page/home_page_view_model.dart';

class SliverFoodContainers extends StatelessWidget {
  final AsyncSnapshot<List<Item>> snapshot;
  final HomePageViewModel viewModel;
  const SliverFoodContainers(
      {Key? key, required this.snapshot, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryColor.withOpacity(0.75),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(2, 4.5),
                )
              ],
            ),
            child: GestureDetector(
              onTap: () {
                viewModel.setFoodHolderProps(
                  foodImagePath: data.photo,
                  foodName: data.name,
                  foodTag: '${data.photo}-$index,',
                  foodPrice: data.price,
                  foodRating: data.rating.toString(),
                  ingredients: data.ingredients,
                  description: data.description,
                  foodId: data.id,
                );
                viewModel.navigateItemDetailPage();
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Hero(
                        tag: '${data.photo}-$index,',
                        child: Image.network(
                          data.photo,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        data.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              CupertinoIcons.heart,
                              color: Colors.white,
                            ),
                            Text(
                              data.rating.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    right: -size.width * 0.0285,
                    top: -size.height * 0.015,
                    child: Container(
                      width: size.width * 0.15,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "₹ ${data.price}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
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
        childCount: snapshot.data?.length ?? 0,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
      ),
    );
  }
}
