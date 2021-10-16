import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/logger.dart';
import 'package:geolocator/geolocator.dart';

class HomePageViewModel extends BaseViewModel {
  late Logger log;

  HomePageViewModel() {
    log = getLogger(runtimeType.toString());
  }
  final Geolocator geolocator = Geolocator();

  // var for getting [LAT] and [LON]
  late Position currentPosition;
  // var for storing address obtained from [_currentPosition]
  late String currentAddress;
  // var for storing distance betweeen current location and required location
  late double distancebetweenTwoPoints;
  bool withinRadius = false;

  /// getting the location in _getCurrentLocation which is initiated in init state .
  getCurrentLocation(BuildContext context) async {
    if (await Geolocator.isLocationServiceEnabled()) {
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        currentPosition = position;

        /// Finding distance between 2 points and setting boolean values to true if it is less than 3 km
        distancebetweenTwoPoints = Geolocator.distanceBetween(
              position.latitude,
              position.longitude,
              12.7806459999,
              80.2186767,
            ) /
            1000;
        if (distancebetweenTwoPoints <= 3) {
          withinRadius = true;
        }
        // _getAddressFromLatLng();
        log.i(distancebetweenTwoPoints.toString());
        log.i(currentPosition.latitude.toString());
        log.i(currentPosition.longitude.toString());
      }).catchError((e) {
        log.e(e);
      });
    } else {
      // turnOnLocation();
      log.e("turn on location");
      turnOnLocation(context);
    }
  }

  turnOnLocation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'This application requires location\n Please enable location from your settings',
            style: TextStyle(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Check [OpenLocationSetting] function in Globals.dart file
                // Geolocator.openLocationSettings();
              },
              child: const Text('Turn on location'),
            )
          ],
        );
      },
    );
  }
}
