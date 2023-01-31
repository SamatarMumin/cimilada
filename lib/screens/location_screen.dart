import 'package:cimilada/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:cimilada/util/constants.dart';

class LocationScreen extends StatefulWidget {
  late final locationWeather;
  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}


class _LocationScreenState extends State<LocationScreen> {
  var temp;
  var condition;
  var city;

  void initState(){
    updateUI(widget.locationWeather);
  }

  void updateUI(var weatherData){
    condition = weatherData['weather'][0]['id'];
    temp = weatherData['main']['temp'].toInt();
    city = weatherData['name'];
    print(temp);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Text('$temp'),
        ),
      ),
    );
  }
}