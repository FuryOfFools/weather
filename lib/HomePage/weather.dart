import 'package:flutter/material.dart';

class CurrentWeather extends StatefulWidget {
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
                image: AssetImage('assets/clear_sky.png'),
              ),
              Text('Ясно'),
            ],
          ),
          Text('Описание погоды'),
        ],
      ),
    );
  }
}
