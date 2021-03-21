import 'package:weather/Bloc/Classes/list.dart';
import 'package:weather/Bloc/Classes/Albums/album.dart';
import 'package:weather/Bloc/Classes/Albums/album5days.dart';
import 'package:weather/Bloc/Classes/location.dart';
import 'package:weather/Bloc/Classes/resources.dart';

class WeatherData {
  String weatherInfo,
      weatherDescription,
      weatherIcon,
      countryCode,
      cityTitle,
      windDirection;
  num temperature,
      feelTemperature,
      pressure,
      humidity,
      visibility,
      windSpeed,
      windDegrees,
      cloudiness,
      timezone,
      cityId;
  DateTime dateTime, sunrise, sunset;
  // Current Weather
  List<WeatherList> list = [];
  WeatherData({Album album, Location location, Album5Days album5days}) {
    this.weatherInfo = album.weather[0].main;
    this.weatherDescription = album.weather[0].description;
    this.weatherIcon = Resources.weatherPng[album.weather[0].icon];
    this.temperature = album.main.temp.toInt();
    this.feelTemperature = album.main.feelsLike.toInt();
    this.pressure = album.main.pressure;
    this.humidity = album.main.humidity;
    this.visibility = album.visibility;
    this.windSpeed = album.wind.speed;
    this.windDegrees = album.wind.deg;
    this.cloudiness = album.clouds.all;
    this.dateTime = DateTime.fromMicrosecondsSinceEpoch(album.dt * 1000);
    this.countryCode = album.sys.country;
    this.sunrise =
        DateTime.fromMicrosecondsSinceEpoch(album.sys.sunrise * 1000);
    this.sunset = DateTime.fromMicrosecondsSinceEpoch(album.sys.sunset * 1000);
    this.timezone = album.timezone;
    this.cityId = album.id;
    this.cityTitle = album.name;
    // Current Weather
    album5days.list.forEach((element) {
      this.list.add(WeatherList(element, cityTitle));
    });
  }
}
