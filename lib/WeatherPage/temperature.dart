import 'package:flutter/material.dart';

class CurrentTemperature extends StatelessWidget {
  final num temp;
  final num feelTemp;
  CurrentTemperature({this.temp, this.feelTemp, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('$temp C'),
          Text('Feel like $feelTemp C'),
        ],
      ),
    );
  }
}
