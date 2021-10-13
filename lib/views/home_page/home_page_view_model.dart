import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/logger.dart';

class HomePageViewModel extends BaseViewModel {
  Logger log;

  HomePageViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
