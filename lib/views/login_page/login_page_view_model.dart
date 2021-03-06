import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../core/locator.dart';
import '../../core/logger.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../drawer_page/drawer_page_view.dart';
import '../navigation/navigation_view.dart';

class LoginPageViewModel extends BaseViewModel {
  late Logger log;

  LoginPageViewModel() {
    log = getLogger(runtimeType.toString());
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late User _user;

  final NavigationService _navigation = locator<NavigationService>();

  Future signInWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    _user = userCredential.user!;
    assert(!_user.isAnonymous);
    User? currentUser = _auth.currentUser;
    assert(_user.uid == currentUser!.uid);
    _navigation.replaceWithTransition(
      const NavigationView(),
      transitionClass: Transition.rightToLeft,
      duration: const Duration(milliseconds: 600),
      popGesture: false,
    );
    log.i("User Name: ${_user.displayName}");
    log.i("User Email ${_user.email}");
  }

  Future signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      _navigation.replaceWithTransition(
        const DrawerPageView(),
        duration: const Duration(milliseconds: 600),
        transitionClass: Transition.rightToLeftWithFade,
        popGesture: false,
      );
    } else {
      log.e(result.status);
      log.e(result.message);
    }
  }
}
