import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zerosandones/core/constants/bottom_sheet_enum.dart';
import 'package:zerosandones/core/locator.dart';
import 'package:zerosandones/core/logger.dart';

class PhoneAuthPageViewModel extends BaseViewModel {
  late Logger log;

  PhoneAuthPageViewModel() {
    log = getLogger(runtimeType.toString());
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;
  PhoneNumber initialCountry = PhoneNumber(isoCode: 'IN');
  late PhoneNumber number;

  final NavigationService _navigation = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  setNumber(PhoneNumber phoneNumber) {
    number = phoneNumber;
  }

  Future signInWithPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number.toString(),
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // await _auth.signInWithCredential(credential);
        await _auth.currentUser?.linkWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          log.e('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        log.wtf(verificationId);
        _bottomSheetService.showCustomSheet(
          variant: BottomSheetType.otp,
          title: 'Enter the OTP',
          description: '',
          mainButtonTitle: 'Submit',
          secondaryButtonTitle: 'Cancel',
          data: verificationId,
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
