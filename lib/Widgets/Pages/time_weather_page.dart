import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';
import '../CurrentWeather/current_weather.dart';

class TimeWeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<WeatherBloc>(context).state.data;
    var time = data.dateTime;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              '${data.cityTitle} (${time.month}.${time.day} ${time.hour}:00)'),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(children: [
          CurrentWeather(),
        ]),
      ),
    );
  }
}
