import 'package:flutter/material.dart';
import 'package:weather/Classes/albums.dart';
import 'package:weather/WeatherPage/current_weather.dart';
import 'package:weather/WeatherPage/time_weather.dart';

class WeatherData extends StatelessWidget {
  final Albums albums;

  const WeatherData({this.albums, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: albums.album5days.list.length,
        itemBuilder: (context, int index) {
          if (index == 0)
            return Column(
              children: [
                CurrentWeather(album: albums.album),
                TimeWeather(weather: albums.album5days.list[index]),
              ],
            );
          else
            return Column(
              children: [
                //CurWeather(album: albums.album),
                TimeWeather(weather: albums.album5days.list[index]),
              ],
            );
        },
      ),
    );
  }
}
