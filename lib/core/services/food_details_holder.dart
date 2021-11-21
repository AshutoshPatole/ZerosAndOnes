import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/models/item.dart';

class FoodDetailHolder extends BaseViewModel {
  late String _foodTag;
  late String _foodImagePath;
  late String _foodName;
  late String _foodPrice;
  late String _foodRating;
  late List<Ingredient> _ingredients;
  late String _description;
  late String _foodId;

  String get foodTag => _foodTag;
  String get foodImagePath => _foodImagePath;
  String get foodName => _foodName;
  String get foodPrice => _foodPrice;
  String get foodRating => _foodRating;
  List<Ingredient> get ingredients => _ingredients;
  String get description => _description;
  String get foodId => _foodId;

  setAllProperties({
    required String foodTag,
    required String foodImagePath,
    required String foodName,
    required String foodPrice,
    required String foodRating,
    required List<Ingredient> ingredients,
    required String description,
    required String foodId,
  }) {
    _foodImagePath = foodImagePath;
    _foodTag = foodTag;
    _foodName = foodName;
    _foodPrice = foodPrice;
    _foodRating = foodRating;
    _ingredients = ingredients;
    _description = description;
    _foodId = foodId;
    notifyListeners();
  }
}
