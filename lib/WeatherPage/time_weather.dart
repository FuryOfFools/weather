import 'package:flutter/material.dart';
import 'package:weather/Classes/album5days.dart';

class TimeWeather extends StatelessWidget {
  final List1 weather;
  const TimeWeather({Key key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.all(5),
      color: Colors.white,
      child: Text('Погода на конкретный день'),
    );
  }
}
