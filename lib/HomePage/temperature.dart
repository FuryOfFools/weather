import 'package:flutter/material.dart';

class CurrentTemperature extends StatefulWidget {
  @override
  _CurrentTemperatureState createState() => _CurrentTemperatureState();
}

class _CurrentTemperatureState extends State<CurrentTemperature> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Temp'),
          Text('Feel Temp'),
        ],
      ),
    );
  }
}
