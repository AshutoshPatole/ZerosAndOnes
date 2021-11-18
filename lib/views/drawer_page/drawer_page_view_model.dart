import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zerosandones/core/locator.dart';
import 'package:zerosandones/core/logger.dart';
import 'package:zerosandones/core/router_constants.dart';
import 'package:zerosandones/views/login_page/login_page_view.dart';

class DrawerPageViewModel extends BaseViewModel {
  late Logger log;

  DrawerPageViewModel() {
    log = getLogger(runtimeType.toString());
  }
  User? user = FirebaseAuth.instance.currentUser;
  final NavigationService _navigationService = locator<NavigationService>();

  Future logout() async {
    _navigationService.replaceWithTransition(const LoginPageView(),
        transitionClass: Transition.cupertino);
    FirebaseAuth.instance.signOut();
  }

  Future navigateToLoginScreen() async {
    _navigationService.navigateTo(loginPageViewRoute);
  }

  Future navigateToEditProfileScreen() async {
    _navigationService.navigateTo(editProfilePageViewRoute);
  }
}
