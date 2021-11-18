import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/logger.dart';

class EditProfilePageViewModel extends BaseViewModel {
  late Logger log;

  EditProfilePageViewModel() {
    log = getLogger(runtimeType.toString());
  }
}
