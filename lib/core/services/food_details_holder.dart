import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/models/item.dart';

class FoodDetailHolder extends BaseViewModel {
  late String _foodTag;
  late String _foodImagePath;
  late String _foodName;
  late String _foodPrice;
  late String _foodRating;
  late Ingredients _ingredients;
  late String _description;

  String get foodTag => _foodTag;
  String get foodImagePath => _foodImagePath;
  String get foodName => _foodName;
  String get foodPrice => _foodPrice;
  String get foodRating => _foodRating;
  Ingredients get ingredients => _ingredients;
  String get description => _description;

  setAllProperties(
      String foodTag,
      String foodImagePath,
      String foodName,
      String foodPrice,
      String foodRating,
      Ingredients ingredients,
      String description) {
    _foodImagePath = foodImagePath;
    _foodTag = foodTag;
    _foodName = foodName;
    _foodPrice = foodPrice;
    _foodRating = foodRating;
    _ingredients = ingredients;
    _description = description;
    notifyListeners();
  }
}
