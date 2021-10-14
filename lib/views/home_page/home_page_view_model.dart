import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/logger.dart';

class HomePageViewModel extends BaseViewModel {
  late Logger log;

  HomePageViewModel() {
    log = getLogger(runtimeType.toString());
  }

  User? user = FirebaseAuth.instance.currentUser;
}
