import 'package:flutter/material.dart';
import 'package:weather/Widgets/CurrentWeather/additional_info.dart';
import 'package:weather/Widgets/CurrentWeather/temperature.dart';
import 'package:weather/Widgets/CurrentWeather/weather.dart';

class CurrentWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Weather(),
        Temperature(),
        AdditionalInfo(), //TODO: добавить sunset, sunrise
      ],
    );
  }
}
