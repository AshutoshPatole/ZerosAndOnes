import 'package:stacked/stacked.dart';

class FoodDetailHolder extends BaseViewModel {
  late String _foodTag;
  late String _foodImagePath;
  late String _foodName;
  late String _foodPrice;
  late String _foodRating;

  String get foodTag => _foodTag;
  String get foodImagePath => _foodImagePath;
  String get foodName => _foodName;
  String get foodPrice => _foodPrice;
  String get foodRating => _foodRating;

  setAllProperties(String foodTag, String foodImagePath, String foodName,
      String foodPrice, String foodRating) {
    _foodImagePath = foodImagePath;
    _foodTag = foodTag;
    _foodName = foodName;
    _foodPrice = foodPrice;
    _foodRating = foodRating;
    notifyListeners();
  }
}
