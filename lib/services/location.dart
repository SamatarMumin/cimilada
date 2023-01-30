import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location{
  late double latitude;
  late double longitude ;
   Future<void>getCurrentLocation() async {
    await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
        longitude =position.longitude;
        latitude = position.latitude;
        print(position);
    } catch (e) {
      print(e);
    }
  }

}


