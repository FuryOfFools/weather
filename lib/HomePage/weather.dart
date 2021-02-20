import 'package:flutter/material.dart';

class CurrentWeather extends StatefulWidget {
  final String curWeather;
  final String descWeather;
  CurrentWeather({this.curWeather, this.descWeather, Key key})
      : super(key: key);

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 60,
                height: 60,
                image: AssetImage(_changeWeatherPng(widget.curWeather)),
              ),
              Text(widget.curWeather),
            ],
          ),
          Text(widget.descWeather),
        ],
      ),
    );
  }

  var _weatherPng = {
    'Clear Sky': 'assets/clear_sky.png',
    'Few Clouds': 'assets/few_clouds.png',
    'Scattered Clouds': 'assets/scattered_clouds.png',
    'Broken Clouds': 'assets/broken_clouds.png',
    'Shower Rain': 'assets/shower_rain.png',
    'Rain': 'assets/rain.png',
    'Thunderstorm': 'assets/thunderstorm.png',
    'Snow': 'assets/snow.png',
    'Mist': 'assets/mist.png'
  };

  String _changeWeatherPng(String weather) {
    return _weatherPng[weather];
  }
}
