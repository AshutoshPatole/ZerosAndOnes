import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

import '../../core/logger.dart';

class CartPageViewModel extends BaseViewModel {
  late Logger log;

  CartPageViewModel() {
    log = getLogger(runtimeType.toString());
  }
}
