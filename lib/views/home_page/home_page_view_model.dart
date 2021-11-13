import 'dart:async';

import 'package:geocoding/geocoding.dart' as loc;
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zerosandones/core/locator.dart';
import 'package:zerosandones/core/logger.dart';
import 'package:zerosandones/core/models/user_location.dart';
import 'package:zerosandones/core/services/temp.dart';
import 'package:zerosandones/views/item_detail_page/item_detail_page_view.dart';

class HomePageViewModel extends BaseViewModel {
  late Logger log;

  HomePageViewModel() {
    log = getLogger(runtimeType.toString());
  }

  final _navigationService = locator<NavigationService>();
  final foodDetailHolder = locator<FoodDetailHolder>();

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

  setFoodHolderProps(
      {required String foodTag,
      required String foodImagePath,
      required String foodName}) {
    foodDetailHolder.setAllProperties(foodTag, foodImagePath, foodName);
  }

  navigateItemDetailPage() async {
    _navigationService.navigateWithTransition(
      ItemDetailPageView(),
      duration: const Duration(milliseconds: 500),
      popGesture: false,
    );
  }
}
