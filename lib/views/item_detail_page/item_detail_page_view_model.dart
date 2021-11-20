import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/locator.dart';
import 'package:zerosandones/core/logger.dart';
import 'package:zerosandones/core/models/mock_ingredients.dart';
import 'package:zerosandones/core/services/food_details_holder.dart';

class ItemDetailPageViewModel extends BaseViewModel {
  late Logger log;

  ItemDetailPageViewModel() {
    log = getLogger(runtimeType.toString());
  }
  final _foodDetailHolder = locator<FoodDetailHolder>();
  String get foodName => _foodDetailHolder.foodName;
  String get foodImagePath => _foodDetailHolder.foodImagePath;
  String get foodTag => _foodDetailHolder.foodTag;
  String get foodPrice => _foodDetailHolder.foodPrice;
  List<Ingredients> get ingredients => _foodDetailHolder.ingredients;
}
