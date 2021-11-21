import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../core/locator.dart';
import '../../core/logger.dart';
import '../../core/router_constants.dart';

class EditProfilePageViewModel extends BaseViewModel {
  late Logger log;

  EditProfilePageViewModel() {
    log = getLogger(runtimeType.toString());
  }
  User user = FirebaseAuth.instance.currentUser!;
  final NavigationService _navigationService = locator<NavigationService>();

  navigateToPhoneAuthenticationPage() {
    _navigationService.navigateTo(phoneAuthPageViewRoute);
  }
}
