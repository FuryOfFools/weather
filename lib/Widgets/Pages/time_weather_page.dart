import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/Classes/classes.dart';
import 'package:weather/Bloc/blocs.dart';
import 'package:weather/Widgets/CurrentWeather/current_weather.dart';

class TimeWeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<WeatherBloc>(context).state;
    final list = state.additionalData;
    final time = list.dateTime;
    return WillPopScope(
      onWillPop: () {
        BlocProvider.of<WeatherBloc>(context)
            .add(DisplayEvent(data: state.data));
        return;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: _appBar(context, list, state),
          body: Column(
            children: [
              DateTimeContainer(time: time),
              CurrentWeather(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(context, list, state) {
    final time = list.dateTime;
    final String sharedData =
        '''Weather in ${list.cityTitle} ${time.month}.${time.day}.${time.year} (${time.hour}:00):
Weather: ${list.weatherDescription}
Temperature: ${list.temperature} C° feel like ${list.feelTemperature} C°
Pressure: ${list.pressure} hPa Humidity: ${list.humidity}% Cloudiness: ${list.cloudiness}%''';
    return AppBar(
      title: Text('${list.cityTitle}'),
      leading: IconButton(
        onPressed: () {
          BlocProvider.of<WeatherBloc>(context)
              .add(DisplayEvent(data: state.data));
        },
        icon: Icon(
          Icons.arrow_back,
          size: 25,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
            icon: Icon(
              Icons.share,
            ),
            onPressed: () async {
              await shareData(sharedData);
            }),
      ],
    );
  }
}

class DateTimeContainer extends StatelessWidget {
  final time;
  const DateTimeContainer({Key key, this.time}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        ' ${time.month}.${time.day}.${time.year} (${time.hour}:00)',
        style: TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }
}
