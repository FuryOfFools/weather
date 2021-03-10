import 'package:flutter/material.dart';
import 'package:weather/Widgets/additional_info.dart';
import 'package:weather/Widgets/temperature.dart';
import 'package:weather/Widgets/weather.dart';

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
