import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<WeatherBloc>(context).state;
    var data;
    if (state.additionalData == null)
      data = state.data;
    else
      data = state.additionalData;
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          WeatherIcon(data: data),
          WeatherDescription(data: data),
        ],
      ),
    );
  }
}

class WeatherIcon extends StatelessWidget {
  final data;
  const WeatherIcon({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          width: 40,
          height: 40,
          image: AssetImage(data.weatherIcon),
        ),
        Text(
          data.weatherInfo,
          style: TextStyle(
            fontSize: 30,
            color: Color(0xffec6e4c),
          ),
        ),
      ],
    );
  }
}

class WeatherDescription extends StatelessWidget {
  final data;
  const WeatherDescription({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Description: ',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${data.weatherDescription}',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
