import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/Classes/classes.dart';
import 'package:weather/Bloc/blocs.dart';
import '../weather_list.dart';

class DisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WeatherData data = BlocProvider.of<WeatherBloc>(context).state.data;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${data.cityTitle}'),
        ),
        body: WeatherDisplayList(),
      ),
    );
  }
}
