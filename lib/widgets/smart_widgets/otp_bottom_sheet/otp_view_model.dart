import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/locator.dart';
import '../../../core/logger.dart';
import '../../../core/router_constants.dart';

class OtpViewModel extends BaseViewModel {
  late Logger log;
  final _navigationService = locator<NavigationService>();

  OtpViewModel() {
    log = getLogger(runtimeType.toString());
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future verifyCode(String verificationId, String code) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: code);
      await _auth.currentUser?.linkWithCredential(credential);
      _navigationService.replaceWith(navigationViewRoute);
    } on FirebaseAuthException catch (e) {
      log.e(e.message);
    }
  }
}
