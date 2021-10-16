import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:zerosandones/core/logger.dart';
import 'package:zerosandones/core/models/user_location.dart';

class LocationService {
  final log = getLogger("LocationService");

  late UserLocation _currentLocation;
  var location = Location();
  final StreamController<UserLocation> _locationController =
      StreamController<UserLocation>();

  double serviceableDistance = 0.0;

  LocationService() {
    location.requestPermission().then((granted) {
      if (PermissionStatus.granted == granted) {
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
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
          }
        });
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
}
