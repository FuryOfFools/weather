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
    this.windDirection = _windDirectionByDegrees(windDegrees);
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
  String _windDirectionByDegrees(int deg) {
    if ((deg >= 0 && deg < 11) || (deg >= 348 && deg <= 360)) return ' N';
    if (deg >= 11 && deg < 33) return ' NNE';
    if (deg >= 33 && deg < 56) return ' NE';
    if (deg >= 56 && deg < 78) return ' ENE';
    if (deg >= 78 && deg < 101) return ' E';
    if (deg >= 101 && deg < 123) return ' ESE';
    if (deg >= 123 && deg < 146) return ' SE';
    if (deg >= 146 && deg < 168) return ' SSE';
    if (deg >= 168 && deg < 191) return ' S';
    if (deg >= 191 && deg < 213) return ' SSW';
    if (deg >= 213 && deg < 236) return ' SW';
    if (deg >= 236 && deg < 258) return ' WSW';
    if (deg >= 258 && deg < 281) return ' W';
    if (deg >= 281 && deg < 303) return ' WNW';
    if (deg >= 303 && deg < 326) return ' NW';
    if (deg >= 326 && deg < 348) return ' NNW';
    return '';
  }
}
