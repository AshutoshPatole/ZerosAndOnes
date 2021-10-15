import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/logger.dart';

class FeedbackPageViewModel extends BaseViewModel {
  Logger? log;

  FeedbackPageViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
