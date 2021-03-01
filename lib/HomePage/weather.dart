import 'package:flutter/material.dart';

class CurrentWeather extends StatefulWidget {
  final String curWeather;
  final String descWeather;
  final String icon;
  CurrentWeather({this.curWeather, this.descWeather, this.icon, Key key})
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
                image: AssetImage(_changeWeatherPng(widget.icon)),
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
    '01d': 'assets/images/01d.png',
    '01n': 'assets/images/01n.png',
    '02d': 'assets/images/02d.png',
    '02n': 'assets/images/02n.png',
    '03d': 'assets/images/03d.png',
    '03n': 'assets/images/03n.png',
    '04d': 'assets/images/04d.png',
    '04n': 'assets/images/04n.png',
    '09d': 'assets/images/09d.png',
    '09n': 'assets/images/09n.png',
    '10d': 'assets/images/10d.png',
    '10n': 'assets/images/10n.png',
    '11d': 'assets/images/11d.png',
    '11n': 'assets/images/11n.png',
    '13d': 'assets/images/13d.png',
    '13n': 'assets/images/13n.png',
    '50d': 'assets/images/50d.png',
    '50n': 'assets/images/50n.png',
  };

  String _changeWeatherPng(String weather) {
    return _weatherPng[weather];
  }
}
