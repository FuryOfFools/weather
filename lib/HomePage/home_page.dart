import 'package:flutter/material.dart';
import 'package:weather/HomePage/temperature.dart';
import 'package:weather/HomePage/weather.dart';
import 'package:weather/HomePage/location.dart';

import 'package:weather/HomePage/temp_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Погода'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Location(location: 'London'),
              CurrentWeather(curWeather: 'Rain', descWeather: ''),
              CurrentTemperature(temp: '-15', feelTemp: '-28'),
              MaterialButton(
                child: Text('Получить погоду'),
                onPressed: () {
                  getWeather();
                },
              ),
              JsonData(text: 'Json text'),
            ],
          ),
        ),
      ),
    );
  }

  void getWeather() {
    return;
  }
}
