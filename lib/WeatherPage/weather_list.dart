import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather/Classes/album5days.dart';

class WeatherList extends StatelessWidget {
  final Album5Days album5days;
  const WeatherList({Key key, this.album5days}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: album5days.list.length,
      itemBuilder: (context, int index) {
        return DayWeather(weather: album5days.list[index]);
      },
    );
  }
}

class DayWeather extends StatelessWidget {
  final List1 weather;
  const DayWeather({Key key, this.weather}) : super(key: key);

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
