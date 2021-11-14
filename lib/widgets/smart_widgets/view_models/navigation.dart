import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
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
  // TODO Bottom sheet
  final _auth = FirebaseAuth.instance;

  navigateToCartPage() async {
    _auth.currentUser?.phoneNumber != null
        ? _navigationService.navigateTo(
            cartPageViewRoute,
          )
        : null;
  }
}
