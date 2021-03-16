import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/Classes/classes.dart';
import 'package:weather/Bloc/blocs.dart';
import 'package:weather/Widgets/CurrentWeather/current_weather.dart';
import '../drawer_widget.dart';
import '../time_weather.dart';

class DisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WeatherData data = BlocProvider.of<WeatherBloc>(context).state.data;
    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Text('${data.cityTitle}'),
        ),
        body: Container(
          child: _listViewBuilder(data),
        ),
      ),
    );
  }

  Widget _listViewBuilder(data) {
    return ListView.builder(
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
    );
  }
}
