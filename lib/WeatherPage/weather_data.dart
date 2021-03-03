import 'package:flutter/material.dart';
import 'package:weather/Classes/albums.dart';
import 'package:weather/WeatherPage/additional_info.dart';
import 'package:weather/WeatherPage/temperature.dart';
import 'package:weather/WeatherPage/weather.dart';
import 'package:weather/WeatherPage/weather_list.dart';

class WeatherData extends StatelessWidget {
  final Albums albums;

  const WeatherData({this.albums, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          CurrentWeather(
              curWeather: albums.album.weather[0].main,
              descWeather: albums.album.weather[0].description,
              icon: albums.album.weather[0].icon),
          CurrentTemperature(
              temp: albums.album.main.temp.toInt(),
              feelTemp: albums.album.main.feelsLike.toInt()),
          AdditionalInfo(),
          WeatherList(album5days: albums.album5days),
        ],
      ),
    );
  }
}
