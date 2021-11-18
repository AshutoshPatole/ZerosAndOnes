import 'package:firebase_auth/firebase_auth.dart';
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
    _auth.currentUser?.phoneNumber != null
        ? _navigationService.navigateTo(
            cartPageViewRoute,
          )
        : showCustomBottomSheet();
  }

  Future showCustomBottomSheet() async {
    var sheetResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.floating,
      title: 'Please Login !',
      description: 'You have to login to place orders.',
      mainButtonTitle: 'Login',
      secondaryButtonTitle: 'Skip',
    );

    log.i('Login confirmation : ${sheetResponse?.confirmed}');
  }
}
