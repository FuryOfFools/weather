import 'package:weather/Bloc/Classes/Albums/weather_list.dart';
import 'package:weather/Bloc/Classes/Albums/album.dart';
import 'package:weather/Bloc/Classes/Albums/album5days.dart';
import 'package:weather/Bloc/Classes/location.dart';

class WeatherData {
  String weatherInfo, weatherDiscription, weatherIcon, countryCode, cityTitle;
  num temperature,
      feelTemperature,
      minTemperature,
      maxTemperature,
      pressure,
      humidity,
      visibility,
      windSpeed,
      windDeg,
      cloudiness,
      timezone,
      cityId;
  DateTime dateTime, sunrise, sunset;
  // Current Weather
  List<WeatherList> list = [];
  WeatherData({Album album, Location location, Album5Days album5days}) {
    this.weatherInfo = album.weather[0].main;
    this.weatherDiscription = album.weather[0].description;
    this.weatherIcon = album.weather[0].icon;
    this.temperature = album.main.temp;
    this.feelTemperature = album.main.feelsLike;
    this.minTemperature = album.main.tempMin;
    this.maxTemperature = album.main.tempMax;
    this.pressure = album.main.pressure;
    this.humidity = album.main.humidity;
    this.visibility = album.visibility;
    this.windSpeed = album.wind.speed;
    this.windDeg = album.wind.deg;
    this.cloudiness = album.clouds.all;
    this.dateTime = DateTime.fromMicrosecondsSinceEpoch(album.dt);
    this.countryCode = album.sys.country;
    this.sunrise = DateTime.fromMicrosecondsSinceEpoch(album.sys.sunrise);
    this.sunset = DateTime.fromMicrosecondsSinceEpoch(album.sys.sunset);
    this.timezone = album.timezone;
    this.cityId = album.id;
    this.cityTitle = album.name;
    // Current Weather
    album5days.list.forEach((element) {
      list.add(WeatherList(element));
    });
  }
}
