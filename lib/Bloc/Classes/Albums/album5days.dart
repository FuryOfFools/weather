class Album5Days {
  //String cod;
  //num message;
  /// A number of timestamps returned in the API response
  //num cnt;

  /// List of Weather
  List<List1> list;

  ///city
  City city;

  Album5Days({this.list});

  Album5Days.fromJson(Map<String, dynamic> json) {
    // cod = json['cod'];
    // message = json['message'];
    //cnt = json['cnt'];
    if (json['list'] != null) {
      list = new List<List1>();
      json['list'].forEach((v) {
        list.add(new List1.fromJson(v));
      });
    }
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }
}

class List1 {
  /// Time of data forecasted, unix, UTC
  num dt;
  Main main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;

  /// Average visibility, metres
  num visibility;

  /// Probability of precipitation
  //num pop;
  Sys sys;

  /// Time of data forecasted, ISO, UTC
  //String dtTxt;
  //Rain rain;

  List1({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    //this.pop,
    this.sys,
    //this.dtTxt,
    //this.rain
  });

  List1.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = new List<Weather>();
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    clouds =
        json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    //pop = json['pop'];
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    //dtTxt = json['dt_txt'];
    //rain = json['rain'] != null ? new Rain.fromJson(json['rain']) : null;
  }
}

class Main {
  num temp;
  num feelsLike;
  // num tempMin;
  // num tempMax;
  num pressure;
  //num seaLevel;
  //num grndLevel;
  num humidity;
  //num tempKf;

  Main({
    this.temp,
    this.feelsLike,
    // this.tempMin,
    // this.tempMax,
    this.pressure,
    //this.seaLevel,
    //this.grndLevel,
    this.humidity,
    //this.tempKf
  });

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    // tempMin = json['temp_min'];
    // tempMax = json['temp_max'];
    pressure = json['pressure'];
    //seaLevel = json['sea_level'];
    //grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    //tempKf = json['temp_kf'];
  }
}

class Weather {
  // num id;
  String main;
  String description;
  String icon;

  Weather({this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class Clouds {
  num all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}

class Wind {
  num speed;
  num deg;

  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }
}

class Sys {
  String pod;

  Sys({this.pod});

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }
}

// class Rain {
//   num d3h;

//   Rain({this.d3h});

//   Rain.fromJson(Map<String, dynamic> json) {
//     d3h = json['3h'];
//   }
// }

class City {
  num id;
  String name;
  Coord coord;
  String country;
  num population;
  num timezone;
  num sunrise;
  num sunset;

  City(
      {this.id,
      this.name,
      this.coord,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}

class Coord {
  num lat;
  num lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }
}
