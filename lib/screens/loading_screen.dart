import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cimilada/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

 void getLocation() async{
  Location location = new Location();
  return await location.getCurrentLocation();
}

void getData() async{
  Response response = await http.get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid={API key}'));
  print(response);
}
class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
