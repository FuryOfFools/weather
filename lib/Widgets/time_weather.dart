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
            '${data.list[index].dateTime.month}.${data.list[index].dateTime.day}',
        time = '${data.list[index].dateTime.hour}:00',
        temp = '${data.list[index].temperature} C',
        weather = '${data.list[index].weatherInfo}',
        icon = '${data.list[index].weatherIcon}';
    return FlatButton(
      onPressed: () {
        BlocProvider.of<WeatherBloc>(context)
            .add(OpenTimeWeatherEvent(data.list[index]));
      },
      child: Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.all(5),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$date $time'),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(temp),
                ),
                Container(
                  width: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(weather),
                      Image(
                        width: 60,
                        height: 50,
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
