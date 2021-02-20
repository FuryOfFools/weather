import 'package:flutter/material.dart';
import 'package:weather/HomePage/temperature.dart';
import 'package:weather/HomePage/weather.dart';
import 'package:weather/HomePage/temp_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var location = 'London';
  String api = '98a3681fb714bcff7aa402873d3642d6';
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location),
        leading: IconButton(
          icon: Icon(
            Icons.room,
            color: Colors.white,
          ),
          onPressed: null,
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              CurrentWeather(curWeather: 'Rain', descWeather: ''),
              CurrentTemperature(temp: '-15', feelTemp: '-28'),
              JsonData(api: api, location: location),
            ],
          ),
        ),
      ),
    );
  }
}
