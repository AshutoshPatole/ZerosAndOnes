import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart' as loc;
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../core/locator.dart';
import '../../core/logger.dart';
import '../../core/models/item.dart';
import '../../core/models/user_location.dart';
import '../../core/services/firebase/user_services.dart';
import '../../core/services/food_details_holder.dart';
import '../item_detail_page/item_detail_page_view.dart';

class HomePageViewModel extends BaseViewModel {
  late Logger log;

  HomePageViewModel() {
    log = getLogger(runtimeType.toString());
  }

  final _navigationService = locator<NavigationService>();
  final foodDetailHolder = locator<FoodDetailHolder>();
  final userService = locator<UserService>();

  final FirebaseFirestore _database = FirebaseFirestore.instance;

  late UserLocation _currentLocation;
  var location = Location();
  final StreamController<UserLocation> _locationController =
      StreamController<UserLocation>();

  double serviceableDistance = -1.0;
  bool _isServiceable = false;
  String address = "";
  bool get isServiceableDistance => _isServiceable;

  startLocation() {
    location.requestPermission().then((granted) {
      if (PermissionStatus.granted == granted) {
        location.onLocationChanged.listen((locationData) {
          if (locationData.latitude != null) {
            _locationController.add(UserLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
            ));
            serviceableDistance = Geolocator.distanceBetween(
                  locationData.latitude!,
                  locationData.longitude!,
                  12.7806459999,
                  80.2186767,
                ) /
                1000;
            _isServiceable = serviceableDistance <= 4.0 ? true : false;
          }
        });
      } else {
        log.i(granted.toString());
      }
    });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;
  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } on Exception catch (e) {
      log.e('Could not get location: ${e.toString()}');
    }

    return _currentLocation;
  }

  getAddress() async {
    UserLocation _location = await getLocation();
    List<loc.Placemark> placemarks = await loc.placemarkFromCoordinates(
        _location.latitude!, _location.longitude!);
    loc.Placemark place = placemarks[0];
    address += "${place.locality}";
  }

  setFoodHolderProps({
    required String foodTag,
    required String foodImagePath,
    required String foodName,
    required String foodPrice,
    required String foodRating,
    required List<Ingredient> ingredients,
    required String description,
    required String foodId,
  }) {
    foodDetailHolder.setAllProperties(
      foodId: foodId,
      description: description,
      foodImagePath: foodImagePath,
      foodName: foodName,
      foodPrice: foodPrice,
      foodRating: foodRating,
      foodTag: foodTag,
      ingredients: ingredients,
    );
  }

  Stream<List<Item>> getData() {
    log.w("GetData called");
    final stream = _database.collection("items").snapshots();
    return stream.map((event) => event.docs.map((doc) {
          log.i(doc.reference.id);
          return Item.fromJson(doc.data());
        }).toList());
  }

  navigateItemDetailPage() async {
    _navigationService.navigateWithTransition(
      const ItemDetailPageView(),
      duration: const Duration(milliseconds: 500),
      popGesture: false,
    );
  }
}
