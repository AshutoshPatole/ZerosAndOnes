import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zerosandones/theme/app_theme.dart';

class ItemShimmer extends StatelessWidget {
  const ItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Shimmer.fromColors(
        baseColor: AppTheme.primaryColor,
        highlightColor: AppTheme.primaryColor.withOpacity(0.8),
        child: Row(
          children: [
            Container(
              width: _size.width * 0.4,
              height: _size.height * 0.3,
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
            ),
          ],
        ),
      ),
    );
  }
}
