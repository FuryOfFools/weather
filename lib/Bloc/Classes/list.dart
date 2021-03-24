import 'package:weather/Bloc/Classes/Albums/album5days.dart';
import 'package:weather/Bloc/Classes/resources.dart';

class WeatherList {
  String weatherInfo, weatherDescription, weatherIcon, cityTitle, windDirection;
  num temperature,
      feelTemperature,
      // minTemperature,
      // maxTemperature,
      pressure,
      humidity,
      cloudiness,
      windSpeed,
      windDegrees,
      visibility;
  DateTime dateTime;
  WeatherList(List1 album, String city) {
    this.weatherInfo = album.weather[0].main;
    this.weatherDescription = album.weather[0].description;
    this.weatherIcon = Resources.weatherPng[album.weather[0].icon];
    this.cityTitle = city;
    this.temperature = album.main.temp.toInt();
    this.feelTemperature = album.main.feelsLike.toInt();
    this.pressure = album.main.pressure;
    this.humidity = album.main.humidity;
    this.cloudiness = album.clouds.all;
    this.windSpeed = album.wind.speed;
    this.windDegrees = album.wind.deg;
    this.visibility = album.visibility;
    this.dateTime =
        DateTime.fromMillisecondsSinceEpoch(album.dt.toInt() * 1000);
  }
}
