import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';

class TimeWeather extends StatelessWidget {
  final int index;
  const TimeWeather({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<WeatherBloc>(context).state.data;
    final String date =
            '${data.list[index].dateTime.month}.${data.list[index].dateTime.day}.${data.list[index].dateTime.year}',
        time = '${data.list[index].dateTime.hour}:00',
        temp = '${data.list[index].temperature} C°',
        weather = '${data.list[index].weatherInfo}',
        icon = '${data.list[index].weatherIcon}';
    return FlatButton(
      onPressed: () {
        BlocProvider.of<WeatherBloc>(context)
            .add(OpenTimeWeatherEvent(data: data, list: data.list[index]));
      },
      child: Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                '$date ($time)',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(temp),
                ),
                Container(
                  width: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(weather),
                      Image(
                        width: 40,
                        height: 40,
                        image: AssetImage(icon),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
