import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zerosandones/theme/app_theme.dart';
import 'package:zerosandones/widgets/smart_widgets/view_models/navigation.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({Key? key, required this.address}) : super(key: key);

  final String address;
  final Navigation navigationModel = Navigation();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.75),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(3, 3),
          ),
          const BoxShadow(
            color: AppTheme.white,
            spreadRadius: 0,
            blurRadius: 0,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Icon(
              CupertinoIcons.location_solid,
              size: 16,
              color: AppTheme.primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(address),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(CupertinoIcons.shopping_cart),
              onPressed: () {
                navigationModel.navigateToCartPage();
              },
            )
          ],
        ),
      ),
    );
  }
}
