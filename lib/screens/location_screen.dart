import 'package:cimilada/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:cimilada/util/constants.dart';
import 'package:cimilada/services/weather.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';


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
  WeatherModel weatherModel = WeatherModel();
  void updateUI(var weatherData){
    condition = weatherData['weather'][0]['id'];
    temp = weatherData['main']['temp'].toInt();
    city = weatherData['name'];
    print(temp);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage(weatherModel.getWeatherIcon(condition)),
           fit: BoxFit.cover
         ),
          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text('$city',textAlign: TextAlign.center, style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 48
                  )
              ),),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 400),
              child: Text('$temp',textAlign: TextAlign.center, style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 48
                )
              ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [IconButton(onPressed: (){

              }, icon: Icon(Icons.location_city,size: 40,),),IconButton(onPressed: (){

              }, icon: Icon(Icons.near_me,size: 40)),
            ])
          ],
        ),


      ),
      
    );
  }
}