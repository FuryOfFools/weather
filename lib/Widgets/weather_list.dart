import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/Classes/classes.dart';
import 'package:weather/Bloc/blocs.dart';
import 'package:weather/Widgets/current_weather.dart';
import 'package:weather/Widgets/time_weather.dart';

class WeatherDisplayList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WeatherData data = BlocProvider.of<WeatherBloc>(context).state.data;
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: data.list.length,
        itemBuilder: (context, int index) {
          if (index == 0)
            return Column(
              children: [
                CurrentWeather(),
                TimeWeather(index: index),
              ],
            );
          else
            return Column(
              children: [
                TimeWeather(index: index),
              ],
            );
        },
      ),
    );
  }
}
