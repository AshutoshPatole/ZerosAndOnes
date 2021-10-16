import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:zerosandones/core/locator.dart';
import 'package:zerosandones/core/logger.dart';
import 'package:zerosandones/core/models/user_location.dart';
import 'package:zerosandones/core/services/location_service.dart';

class HomePageViewModel extends BaseViewModel {
  late Logger log;

  HomePageViewModel() {
    log = getLogger(runtimeType.toString());
  }

  Stream<UserLocation> locationStream = LocationService().locationStream;

  final bool servicableDistance = LocationService().serviceableDistance <= 4;
}
