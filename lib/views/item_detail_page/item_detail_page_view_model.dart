import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/locator.dart';
import 'package:zerosandones/core/logger.dart';
import 'package:zerosandones/core/services/temp.dart';

class ItemDetailPageViewModel extends BaseViewModel {
  late Logger log;

  ItemDetailPageViewModel() {
    log = getLogger(runtimeType.toString());
  }
  final _foodDetailHolder = locator<FoodDetailHolder>();
  String get foodName => _foodDetailHolder.foodName;
  String get foodImagePath => _foodDetailHolder.foodImagePath;
  String get foodTag => _foodDetailHolder.foodTag;
}
