import 'package:flutter/material.dart';

class CurrentTemperature extends StatefulWidget {
  final double temp;
  final double feelTemp;
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
          Text('Feel like ${widget.feelTemp} C'),
        ],
      ),
    );
  }
}
