import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';

class Temperature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<WeatherBloc>(context).state.data;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${data.minTemperature} C > ',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                '${data.temperature} C',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              Text(
                ' < ${data.maxTemperature} C',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey[700],
                ),
              ),
            ],
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
