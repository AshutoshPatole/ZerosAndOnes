import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import '../../core/logger.dart';

class FeedbackPageViewModel extends BaseViewModel {
  Logger? log;

  FeedbackPageViewModel() {
    log = getLogger(runtimeType.toString());
  }
}
