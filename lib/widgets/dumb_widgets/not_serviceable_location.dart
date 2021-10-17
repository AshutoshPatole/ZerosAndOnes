import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotServiceableLocation extends StatelessWidget {
  const NotServiceableLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svg/nolocation.svg',
          height: 300,
          width: 300,
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Sorry! We are not available at this location till now but we hope reaching your nearest location soon.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
    ;
  }
}
