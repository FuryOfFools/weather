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
    'Clear Sky': 'assets/images/clear_sky.png',
    'Few Clouds': 'assets/images/few_clouds.png',
    'Scattered Clouds': 'assets/images/scattered_clouds.png',
    'Broken Clouds': 'assets/images/broken_clouds.png',
    'Shower Rain': 'assets/images/shower_rain.png',
    'Rain': 'assets/images/rain.png',
    'Thunderstorm': 'assets/images/thunderstorm.png',
    'Snow': 'assets/images/snow.png',
    'Mist': 'assets/images/mist.png'
  };

  String _changeWeatherPng(String weather) {
    return _weatherPng[weather];
  }
}
