import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/Classes/classes.dart';
import 'package:weather/Bloc/blocs.dart';
import 'package:weather/Widgets/additional_info.dart';
import 'package:weather/Widgets/temperature.dart';
import '../weather.dart';

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
              BlocProvider.of<WeatherBloc>(context)
                  .add(WeatherRequestEvent(Location(city: data.cityTitle)));
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
            Weather(),
            Temperature(),
            AdditionalInfo(),
          ],
        ),
      ),
    );
  }
}
