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
                offset: const Offset(2, 4),
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
          top: size.height * 0.05,
          child: Container(
            width: size.width * 0.4,
            height: size.height * 0.4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),
        Positioned(
          left: size.width * 0.05,
          bottom: size.height * 0.05,
          child: Container(
            width: size.width * 0.4,
            height: size.height * 0.4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),
        Positioned(
          right: -50,
          top: -65,
          child: Image.asset(
            'assets/images/nice.png',
            width: 200,
            height: 200,
          ),
        ),
      ],
    );
  }
}
