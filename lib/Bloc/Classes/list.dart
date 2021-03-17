import 'package:weather/Bloc/Classes/Albums/album5days.dart';
import 'package:weather/Bloc/Classes/data.dart';
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
    this.windDirection = _windDirectionByDegrees(windDegrees.toDouble());
    this.visibility = album.visibility;
    this.dateTime =
        DateTime.fromMillisecondsSinceEpoch(album.dt.toInt() * 1000);
  }
  String _windDirectionByDegrees(double deg) {
    if ((deg >= 0.0 && deg < 11.0) || (deg >= 348.0 && deg <= 360.0))
      return ' N';
    if (deg >= 11.0 && deg < 33.0) return ' NNE';
    if (deg >= 33.0 && deg < 56.0) return ' NE';
    if (deg >= 56.0 && deg < 78.0) return ' ENE';
    if (deg >= 78.0 && deg < 101.0) return ' E';
    if (deg >= 101.0 && deg < 123.0) return ' ESE';
    if (deg >= 123.0 && deg < 146.0) return ' SE';
    if (deg >= 146.0 && deg < 168.0) return ' SSE';
    if (deg >= 168.0 && deg < 191.0) return ' S';
    if (deg >= 191.0 && deg < 213.0) return ' SSW';
    if (deg >= 213.0 && deg < 236.0) return ' SW';
    if (deg >= 236.0 && deg < 258.0) return ' WSW';
    if (deg >= 258.0 && deg < 281.0) return ' W';
    if (deg >= 281.0 && deg < 303.0) return ' WNW';
    if (deg >= 303.0 && deg < 326.0) return ' NW';
    if (deg >= 326.0 && deg < 348.0) return ' NNW';
    return '';
  }
}
