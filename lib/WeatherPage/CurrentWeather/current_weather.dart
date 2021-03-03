import 'package:flutter/material.dart';
import 'package:weather/Classes/album.dart' as Alb;
import 'package:weather/WeatherPage/CurrentWeather/additional_info.dart';
import 'package:weather/WeatherPage/CurrentWeather/temperature.dart';
import 'package:weather/WeatherPage/CurrentWeather/weather.dart';

class CurrentWeather extends StatelessWidget {
  final Alb.Album album;
  const CurrentWeather({Key key, this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Weather(
            curWeather: album.weather[0].main,
            descWeather: album.weather[0].description,
            icon: album.weather[0].icon),
        CurrentTemperature(
            temp: album.main.temp.toInt(),
            feelTemp: album.main.feelsLike.toInt()),
        //TODO: добавить sunset, sunrise
        AdditionalInfo(
          wind: album.wind,
          humidity: album.main.humidity,
          pressure: album.main.pressure,
          visibility: album.visibility,
          clouds: album.clouds,
        ),
      ],
    );
  }
}
