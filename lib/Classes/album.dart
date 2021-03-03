class Album {
  /// Geolocation
  Coord coord;

  /// Weather
  List<Weather> weather;

  /// Internal parameter
  String base;

  /// temperature, pressure, humidity
  Main main;

  /// Visibility, meter
  num visibility;

  /// Wind speed, direction
  Wind wind;

  /// Cloudiness, %
  Clouds clouds;

  /// Time of data calculation, unix, UTC
  num dt;

  /// Country code, sunrise, sunset
  Sys sys;

  /// Shift in seconds from UTC
  num timezone;

  /// City ID
  num id;

  /// City name
  String name;

  /// Internal parameter
  num cod;

  Album(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  Album.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = new List<Weather>();
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    clouds =
        json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }
}

class Coord {
  /// City geo location, longitude
  num lon;

  /// City geo location, latitude
  num lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }
}

/// Weather
class Weather {
  /// Weather condition id
  num id;

  /// Group of weather parameters (Rain, Snow, Extreme etc.)
  String main;

  ///  Weather condition within the group. You can get the output in your language.
  String description;

  /// Weather icon id
  String icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class Main {
  /// Temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  num temp;

  /// Temperature. This temperature parameter accounts for the human perception of weather. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  num feelsLike;

  /// Minimum temperature at the moment. This is minimal currently observed temperature (within large megalopolises and urban areas). Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  num tempMin;

  /// Maximum temperature at the moment. This is maximal currently observed temperature (within large megalopolises and urban areas). Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  num tempMax;

  /// Atmospheric pressure (on the sea level, if there is no sea_level or grnd_level data), hPa
  num pressure;

  /// Humidity, %
  num humidity;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
}

class Wind {
  /// Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour.
  num speed;

  /// Wind direction, degrees (meteorological)
  num deg;

  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }
}

class Clouds {
  /// Cloudiness, %
  num all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}

class Sys {
  /// Internal parameter
  num type;

  /// Internal parameter
  num id;

  /// Country code
  String country;

  /// Sunrise time, unix, UTC
  num sunrise;

  /// Sunset time, unix, UTC
  num sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}
