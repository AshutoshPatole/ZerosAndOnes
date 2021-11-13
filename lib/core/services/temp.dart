import 'package:stacked/stacked.dart';

class FoodDetailHolder extends BaseViewModel {
  late String _foodTag;
  late String _foodImagePath;
  late String _foodName;

  String get foodTag => _foodTag;
  String get foodImagePath => _foodImagePath;
  String get foodName => _foodName;

  setAllProperties(String foodTag, String foodImagePath, String foodName) {
    _foodImagePath = foodImagePath;
    _foodTag = foodTag;
    _foodName = foodName;
    notifyListeners();
  }
}
