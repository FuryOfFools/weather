import 'package:flutter/material.dart';

class TimeWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.all(5),
      color: Colors.white,
      child: Text('Погода на конкретный день'),
      // TODO: Сделать реализацию погоды по времени
    );
  }
}
