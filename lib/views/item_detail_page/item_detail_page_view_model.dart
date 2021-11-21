import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import '../../core/locator.dart';
import '../../core/logger.dart';
import '../../core/models/item.dart';
import '../../core/services/firebase/add_user_service.dart';
import '../../core/services/food_details_holder.dart';

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
  String get foodId => _foodDetailHolder.foodId;
  List<Ingredient> get ingredients => _foodDetailHolder.ingredients;
}
