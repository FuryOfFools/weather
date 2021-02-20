import 'package:flutter/material.dart';
import 'package:weather/HomePage/temperature.dart';
import 'package:weather/HomePage/weather.dart';
import 'package:weather/HomePage/location.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Погода'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Location(),
              CurrentWeather(),
              CurrentTemperature(),
            ],
          ),
        ),
      ),
    );
  }
}
