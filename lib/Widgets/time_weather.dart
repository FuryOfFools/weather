import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/Classes/classes.dart';
import 'package:weather/Bloc/blocs.dart';

class TimeWeather extends StatelessWidget {
  final int index;
  const TimeWeather({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WeatherData data = BlocProvider.of<WeatherBloc>(context).state.data;
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.all(5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              '${data.list[index].dateTime.month}.${data.list[index].dateTime.day} ${data.list[index].dateTime.hour}:00'),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('${data.list[index].temperature} C'),
              ),
              Container(
                width: 110,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('${data.list[index].weatherInfo}'),
                    Image(
                      width: 60,
                      height: 50,
                      image: AssetImage('${data.list[index].weatherIcon}'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
