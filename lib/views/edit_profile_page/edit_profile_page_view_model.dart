import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/logger.dart';

class EditProfilePageViewModel extends BaseViewModel {
  late Logger log;

  EditProfilePageViewModel() {
    log = getLogger(runtimeType.toString());
  }
  User user = FirebaseAuth.instance.currentUser!;
}
