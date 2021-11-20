import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/models/mock_ingredients.dart';

class FoodDetailHolder extends BaseViewModel {
  late String _foodTag;
  late String _foodImagePath;
  late String _foodName;
  late String _foodPrice;
  late String _foodRating;
  late List<Ingredients> _ingredients;

  String get foodTag => _foodTag;
  String get foodImagePath => _foodImagePath;
  String get foodName => _foodName;
  String get foodPrice => _foodPrice;
  String get foodRating => _foodRating;
  List<Ingredients> get ingredients => _ingredients;

  setAllProperties(String foodTag, String foodImagePath, String foodName,
      String foodPrice, String foodRating, List<Ingredients> ingredients) {
    _foodImagePath = foodImagePath;
    _foodTag = foodTag;
    _foodName = foodName;
    _foodPrice = foodPrice;
    _foodRating = foodRating;
    _ingredients = ingredients;
    notifyListeners();
  }
}
