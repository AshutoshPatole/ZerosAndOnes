import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zerosandones/core/constants/bottom_sheet_enum.dart';
import 'package:zerosandones/core/locator.dart';
import 'package:zerosandones/core/logger.dart';
import 'package:zerosandones/core/router_constants.dart';

class Navigation extends BaseViewModel {
  late Logger log;

  Navigation() {
    log = getLogger(runtimeType.toString());
  }
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _auth = FirebaseAuth.instance;

  navigateToCartPage() async {
    _auth.currentUser?.uid != null
        ? _navigationService.navigateTo(
            cartPageViewRoute,
          )
        : showLoginConfirmation();
  }

  Future showLoginConfirmation() async {
    var sheetResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.floating,
      title: 'Please Login !',
      description: 'You have to login to place orders.',
      mainButtonTitle: 'Login',
      secondaryButtonTitle: 'Skip',
    );

    log.i('Login confirmation : ${sheetResponse?.confirmed}');
    if (sheetResponse?.confirmed == true) {
      _navigationService.navigateTo(loginPageViewRoute);
    } else {
      Fluttertoast.showToast(
        msg: "You cannot add products in the cart.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red.shade600,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
