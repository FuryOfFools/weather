import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';
import 'package:weather/Bloc/Classes/classes.dart';
import 'package:weather/Bloc/weather_bloc.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<WeatherBloc>(context).state.data;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Поиск погоды по городу'),
          leading: IconButton(
            onPressed: () {
              BlocProvider.of<WeatherBloc>(context)
                  .add(WeatherRequestEvent(Location(city: data)));
            },
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
        body: TextField(
          decoration: InputDecoration(
            labelText: 'Введите название города:',
          ),
        ),
      ),
    );
  }
}
