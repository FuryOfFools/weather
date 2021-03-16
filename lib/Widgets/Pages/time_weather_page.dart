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
        appBar: _appBar(context, list, state),
        body: Column(
          children: [
            _dateTimeContainer(time),
            CurrentWeather(),
          ],
        ),
      ),
    );
  }

  Widget _dateTimeContainer(time) {
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

  Widget _appBar(context, list, state) {
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
    );
  }
}
