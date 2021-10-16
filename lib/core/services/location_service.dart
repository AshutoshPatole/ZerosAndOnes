import 'dart:async';

import 'package:location/location.dart';
import 'package:zerosandones/core/logger.dart';
import 'package:zerosandones/core/models/user_location.dart';

class LocationService {
  late UserLocation _currentLocation;
  final log = getLogger("LocationService");
  var location = Location();
  final StreamController<UserLocation> _locationController =
      StreamController<UserLocation>();

  LocationService() {
    // Request permission to use location
    location.requestPermission().then((granted) {
      if (PermissionStatus.granted == granted) {
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            _locationController.add(UserLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
            ));
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
