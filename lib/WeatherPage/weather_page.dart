// Dart & Flutter
import 'package:flutter/material.dart';
// Classes
import 'package:weather/Classes/selected_location.dart';
// Widgets
import 'package:weather/WeatherPage/weather_appbar.dart';
import 'package:weather/WeatherPage/weather_widget.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  var api = '98a3681fb714bcff7aa402873d3642d6';
  var location = ValueNotifier<SelectedLocation>(SelectedLocation());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WeatherAppBar(location: location),
      body: SafeArea(
        child: Container(
          color: Colors.white70,
          child: ValueListenableBuilder(
            valueListenable: location,
            builder: (context, SelectedLocation value, child) {
              return WeatherWidget(api: api, location: value);
            },
          ),
        ),
      ),
    );
  }
}
