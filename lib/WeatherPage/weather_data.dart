import 'package:flutter/material.dart';
import 'package:weather/Classes/album.dart';
import 'package:weather/WeatherPage/temperature.dart';
import 'package:weather/WeatherPage/weather.dart';

class WeatherData extends StatelessWidget {
  final Album album;

  WeatherData({this.album, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CurrentWeather(
              curWeather: album.weather[0].main,
              descWeather: album.weather[0].description,
              icon: album.weather[0].icon),
          CurrentTemperature(
              temp: album.main.temp, feelTemp: album.main.feelsLike),
        ],
      ),
    );
  }
}
