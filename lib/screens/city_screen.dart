import 'package:flutter/material.dart';
import 'package:cimilada/util/constants.dart';
import 'package:cimilada/services/weather.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;
  var locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: null,
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Location",
                    icon: Icon(Icons.location_city)
                  ),
                  onChanged: (value){
                    cityName = value;
                    //print(cityName);
                  },
                  controller: locationController,
                ),
              ),
              TextButton(
                onPressed: () {
                  print(cityName);
                  locationController.clear();
                  //print(cityName);
                  Navigator.pop(context,cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),

            ],
          ),
        ),

      ),
    );
  }
}
