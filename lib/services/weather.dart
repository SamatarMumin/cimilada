import 'dart:io';

import 'package:cimilada/services/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cimilada/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cimilada/services/network.dart';
const apikey = '1e43bc8ef425f7bd1a9d0422b85cb35a';
const site = 'https://api.openweathermap.org/data/2.5/weather';
late double lat;
late double long;
late String cityName;

class WeatherModel {

  Future<dynamic> getLocationWeather() async{
    Location location = new Location();
    await location.getCurrentLocation();
    lat = location.latitude.toDouble();
    long = location.longitude.toDouble();

    Network networkResponse = new Network(
        url:
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apikey&units=metric');


    var weatherData = await networkResponse.getData();
    print(weatherData);
    return weatherData;
  }


  Future<dynamic> getCityWeather(cityName) async{
    Network networkResponse = new Network(
        url:
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric');
    print('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apikey&units=metric');
    var weatherData = await networkResponse.getData();
    print(weatherData);
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'images/Rainy.png';
    } else if (condition < 400) {
      return 'images/Rainy.png';
    } else if (condition < 600) {
      return 'images/Rainy.png';
    } else if (condition < 700) {
      return 'images/Rainy.png';
    } else if (condition < 800) {
      return 'images/Beautiful Night.png';
    } else if (condition == 800) {
      return 'images/So Hot.png';
    } else if (condition <= 804) {
      return 'images/Beautiful Night.png';
    } else {
      return 'images/So Hot.png';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Scorching Hot';
    } else if (temp > 20) {
      return 'Sunny';
    } else if (temp < 10) {
      return 'Warm';
    } else {
      return 'Cold';
    }
  }
}
