import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';
import 'package:weather/Widgets/CurrentWeather/current_weather.dart';

class TimeWeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<WeatherBloc>(context).state;
    var list = state.additionalData;
    var time = list.dateTime;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${list.cityTitle}'),
          leading: IconButton(
            onPressed: () {
              BlocProvider.of<WeatherBloc>(context)
                  .add(DisplayEvent(state.data));
            }, //TODO не забудь
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    ' ${time.month}.${time.day}.${time.year} (${time.hour}:00)',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
            CurrentWeather(),
          ],
        ),
      ),
    );
  }
}
