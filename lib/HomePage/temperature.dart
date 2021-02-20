import 'package:flutter/material.dart';

class CurrentTemperature extends StatefulWidget {
  final String temp;
  final String feelTemp;
  CurrentTemperature({this.temp, this.feelTemp, Key key}) : super(key: key);

  @override
  _CurrentTemperatureState createState() => _CurrentTemperatureState();
}

class _CurrentTemperatureState extends State<CurrentTemperature> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('${widget.temp} C'),
          Text('${widget.feelTemp} C'),
        ],
      ),
    );
  }
}
