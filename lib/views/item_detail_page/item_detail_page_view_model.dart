import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/locator.dart';
import 'package:zerosandones/core/logger.dart';
import 'package:zerosandones/core/models/item.dart';
import 'package:zerosandones/core/services/firebase/add_user_service.dart';
import 'package:zerosandones/core/services/food_details_holder.dart';

class ItemDetailPageViewModel extends BaseViewModel {
  late Logger log;

  ItemDetailPageViewModel() {
    log = getLogger(runtimeType.toString());
  }
  final _foodDetailHolder = locator<FoodDetailHolder>();
  final userService = locator<UserService>();

  String get foodName => _foodDetailHolder.foodName;
  String get foodImagePath => _foodDetailHolder.foodImagePath;
  String get foodTag => _foodDetailHolder.foodTag;
  String get foodPrice => _foodDetailHolder.foodPrice;
  String get description => _foodDetailHolder.description;
  List<Ingredient> get ingredients => _foodDetailHolder.ingredients;
}
