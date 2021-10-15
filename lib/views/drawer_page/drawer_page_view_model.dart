import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zerosandones/core/locator.dart';
import 'package:zerosandones/core/logger.dart';
import 'package:zerosandones/views/login_page/login_page_view.dart';

class DrawerPageViewModel extends BaseViewModel {
  late Logger log;

  DrawerPageViewModel() {
    log = getLogger(runtimeType.toString());
  }
  User? user = FirebaseAuth.instance.currentUser;
  final NavigationService _service = locator<NavigationService>();

  Future logout() async {
    _service.replaceWithTransition(const LoginPageView(),
        transitionClass: Transition.cupertino);
    FirebaseAuth.instance.signOut();
  }
}
