import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/Classes/classes.dart';
import 'package:weather/Bloc/blocs.dart';

class Temperature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WeatherData data = BlocProvider.of<WeatherBloc>(context).state.data;
    return Container(
      child: Column(
        children: [
          Text(
            '${data.temperature} C',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          Text(
            'Feel like ${data.feelTemperature} C',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
