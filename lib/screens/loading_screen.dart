import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cimilada/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cimilada/services/network.dart';
import 'location_screen.dart';

const apikey = '1e43bc8ef425f7bd1a9d0422b85cb35a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = new Location();
    await location.getCurrentLocation();
    lat = location.latitude;
    long = location.longitude;

    Network networkResponse = new Network(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apikey&units=metric');

    var weatherData = await networkResponse.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData);
    }));

   
  }

  @override
  void initState() {
    getLocation();
  }

  late double lat;
  late double long;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SpinKitSquareCircle(
       color: Colors.white,
       size: 50.0,
       ),

    );
  }
}

/*

     print(city);
    print(weatherdesc);
 */