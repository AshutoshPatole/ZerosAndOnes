import 'package:flutter/material.dart';
import 'package:zerosandones/theme/app_theme.dart';

class Coupon extends StatelessWidget {
  const Coupon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: size.width,
          height: size.height * 0.2,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor.withOpacity(0.75),
                spreadRadius: 0,
                blurRadius: 5,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "25% Off",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Apply APPSPL25 coupon",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: size.width * 0.05,
          top: size.height * 0.1,
          child: Container(
            width: size.width * 0.4,
            height: size.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(100),
                topRight: Radius.circular(100),
              ),
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),
        Positioned(
          left: size.width * 0.05,
          top: size.height * 0,
          child: Container(
            width: size.width * 0.4,
            height: size.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),
        Positioned(
          right: -size.width * 0.25,
          top: -size.height * 0.1,
          child: Image.asset(
            'assets/images/nice.png',
            width: size.width * 0.8,
            height: size.height * 0.3,
          ),
        ),
      ],
    );
  }
}
