import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';

class TimeWeather extends StatelessWidget {
  final int index;
  const TimeWeather({Key key, this.index}) : super(key: key);
  Widget build(BuildContext context) {
    final data = BlocProvider.of<WeatherBloc>(context).state.data;
    final String date =
            '${data.list[index].dateTime.month}.${data.list[index].dateTime.day}.${data.list[index].dateTime.year}',
        time = '${data.list[index].dateTime.hour}:00',
        temp = '${data.list[index].temperature} C°',
        weather = '${data.list[index].weatherInfo}',
        icon = '${data.list[index].weatherIcon}';
    return TextButton(
      onPressed: () {
        BlocProvider.of<WeatherBloc>(context)
            .add(OpenTimeWeatherEvent(data: data, list: data.list[index]));
      },
      child: Container(
        width: double.infinity,
        //height: 40,
        padding: const EdgeInsets.all(2),
        //margin: const EdgeInsets.all(5),
        decoration: _decoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                '$date ($time)',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(temp),
                ),
                Weather(
                  weather: weather,
                  icon: icon,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey[300],
          spreadRadius: 1,
          blurRadius: 3,
        ),
      ],
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.white,
    );
  }
}

class Weather extends StatelessWidget {
  final String weather;
  final String icon;
  const Weather({Key key, this.weather, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            weather,
            style: TextStyle(
              color: const Color(0xffec6e4c),
            ),
          ),
          Image(
            width: 40,
            height: 40,
            image: AssetImage(icon),
          ),
        ],
      ),
    );
  }
}
