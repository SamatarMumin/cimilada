import 'package:cimilada/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cimilada/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cimilada/services/network.dart';
import 'location_screen.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    var weatherData = await WeatherModel().getLocationWeather();
    print(weatherData);
   await Navigator.push(context, MaterialPageRoute(builder: (context){
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