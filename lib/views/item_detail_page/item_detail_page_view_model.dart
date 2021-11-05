import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/logger.dart';

class ItemDetailPageViewModel extends BaseViewModel {
  late Logger log;

  ItemDetailPageViewModel() {
    log = getLogger(runtimeType.toString());
  }
}
