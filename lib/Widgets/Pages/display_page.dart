import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/Classes/classes.dart';
import 'package:weather/Bloc/blocs.dart';
import 'package:weather/Widgets/CurrentWeather/current_weather.dart';
import 'package:weather/Widgets/drawer_widget.dart';
import 'package:weather/Widgets/time_weather.dart';

class DisplayPage extends StatelessWidget {
  const DisplayPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final WeatherData data = BlocProvider.of<WeatherBloc>(context).state.data;
    final String sharedData = '''Current Weather in ${data.cityTitle}:
Weather: ${data.weatherDescription}
Temperature: ${data.temperature} C° feel like ${data.feelTemperature} C°
Pressure: ${data.pressure} hPa Humidity: ${data.humidity}% Cloudiness: ${data.cloudiness}%''';
    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Text('${data.cityTitle}'),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.share,
                ),
                onPressed: () async {
                  await shareData(sharedData);
                }),
          ],
        ),
        body: Container(
          child: ListViewBuilder(length: data.list.length),
        ),
      ),
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  final int length;
  const ListViewBuilder({Key key, this.length}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: length,
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
