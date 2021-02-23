// Dart & Flutter
import 'package:flutter/material.dart';
import 'package:location/location.dart';
// Classes
import 'package:weather/Classes/selected_location.dart';
import 'package:weather/Classes/weather_info.dart';
// Widgets
import 'package:weather/HomePage/temperature.dart';
import 'package:weather/HomePage/weather.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var location = SelectedLocation();
  String api = '98a3681fb714bcff7aa402873d3642d6';
  String curWeather = 'Rain', descWeather = '', temp = '-8', feelTemp = '-12';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.city),
        leading: IconButton(
          icon: Icon(
            Icons.room,
            color: Colors.white,
          ),
          onPressed: _getLocation,
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: _getData(api, location),
            builder: (content, snapshot) {
              if (snapshot.hasData)
                return WeatherData(
                  curWeather: curWeather,
                  descWeather: descWeather,
                  temp: temp,
                  feelTemp: feelTemp,
                );
              else
                return Text('Не удалось определить погоду');
            }),
      ),
    );
  }

  Future _getLocation() async {
    var location = SelectedLocation(city: this.location.city);
    var status = false;
    LocationData locData;
    var loc = Location();
    try {
      status = await loc.requestService();
      if (status) {
        locData = await loc.getLocation();
        location.lat = locData.latitude.toString();
        location.lon = locData.longitude.toString();
        this.location = location;
      }
    } catch (e) {
      throw Exception('Ошибка получения местоположения');
    }
    return;
  }

  Future<WeatherInfo> _getData(String api, SelectedLocation location) {
    Future.delayed(Duration(seconds: 10));
    return Future.value(WeatherInfo());
    //todo: Доделать метод получения данных
  }
}

class WeatherData extends StatelessWidget {
  final String curWeather;
  final String descWeather;
  final String temp;
  final String feelTemp;
  WeatherData(
      {this.curWeather, this.descWeather, this.temp, this.feelTemp, Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CurrentWeather(curWeather: curWeather, descWeather: descWeather),
          CurrentTemperature(temp: temp, feelTemp: feelTemp),
        ],
      ),
    );
  }
}
