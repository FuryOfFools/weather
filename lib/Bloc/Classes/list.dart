import 'package:weather/Bloc/Classes/Albums/album5days.dart';
import 'package:weather/Bloc/Classes/resources.dart';

class WeatherList {
  String weatherInfo, weatherDiscription, weatherIcon, dayOrNight;
  num temperature,
      feelTemperature,
      minTemperature,
      maxTemperature,
      pressure,
      humidity,
      cloudiness,
      windSpeed,
      windDeg,
      visibility,
      probabilityPrecipitation;
  DateTime dateTime;
  WeatherList(List1 album) {
    this.weatherInfo = album.weather[0].main;
    this.weatherDiscription = album.weather[0].description;
    this.weatherIcon = Resources.weatherPng[album.weather[0].icon];
    this.dayOrNight = album.sys.pod;
    this.temperature = album.main.temp.toInt();
    this.feelTemperature = album.main.feelsLike.toInt();
    this.minTemperature = album.main.tempMin.toInt();
    this.maxTemperature = album.main.tempMax.toInt();
    this.pressure = album.main.pressure;
    this.humidity = album.main.humidity;
    this.cloudiness = album.clouds.all;
    this.windSpeed = album.wind.speed;
    this.windDeg = album.wind.deg;
    this.visibility = album.visibility;
    this.probabilityPrecipitation = album.pop;
    //this.rainVolume = album.rain.d3h;
    this.dateTime =
        DateTime.fromMillisecondsSinceEpoch(album.dt.toInt() * 1000);
  }
}
