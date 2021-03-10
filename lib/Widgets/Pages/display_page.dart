import 'package:flutter/material.dart';
import 'package:weather/Bloc/Classes/classes.dart';

class DisplayPage extends StatelessWidget {
  final WeatherData data;
  const DisplayPage({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
        ),
      ),
    );
  }
}
