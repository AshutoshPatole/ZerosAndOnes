import 'package:flutter/material.dart';
import 'package:zerosandones/theme/app_theme.dart';

class GetLocationCircularProgressIndicator extends StatelessWidget {
  const GetLocationCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          const LinearProgressIndicator(
            color: AppTheme.primaryColor,
            backgroundColor: Color(0x3dffffff),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: size.height * 0.45,
            child: const Text(
              "Fetching Location...",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
