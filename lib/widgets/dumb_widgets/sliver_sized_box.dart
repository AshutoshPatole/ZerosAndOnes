import 'package:flutter/material.dart';

class SliverSizedBox extends StatelessWidget {
  final double size;
  const SliverSizedBox({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: size,
      ),
    );
  }
}
