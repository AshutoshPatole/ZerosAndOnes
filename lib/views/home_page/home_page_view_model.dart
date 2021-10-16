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

  late Position currentPosition;

  late String currentAddress;

  late double distancebetweenTwoPoints;
  bool withinRadius = false;
  bool isLocationEnabled = false;

  getCurrentLocation(BuildContext context) async {
    if (await Geolocator.isLocationServiceEnabled()) {
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        currentPosition = position;

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

        log.i(distancebetweenTwoPoints.toString());
        log.i(currentPosition.latitude.toString());
        log.i(currentPosition.longitude.toString());
      }).catchError((e) {
        log.e(e);
      });
    } else {
      log.e("turn on location");
      isLocationEnabled = false;
      // turnOnLocation(context);
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
              },
              child: const Text('Turn on location'),
            )
          ],
        );
      },
    );
  }
}
