import 'package:flutter/material.dart';
import 'package:weather/HomePage/temperature.dart';
import 'package:weather/HomePage/weather.dart';

class WeatherData extends StatelessWidget {
  final String curWeather;
  final String descWeather;
  final String icon;
  final num temp;
  final num feelTemp;
  WeatherData(
      {this.curWeather,
      this.descWeather,
      this.icon,
      this.temp,
      this.feelTemp,
      Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CurrentWeather(
              curWeather: curWeather, descWeather: descWeather, icon: icon),
          CurrentTemperature(temp: temp, feelTemp: feelTemp),
        ],
      ),
    );
  }
}
