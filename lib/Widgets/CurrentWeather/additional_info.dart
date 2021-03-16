import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';

class AdditionalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<WeatherBloc>(context).state;
    var data;
    if (state.additionalData == null)
      data = state.data;
    else
      data = state.additionalData;
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.amber[50],
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    _addInfo('Wind: ', '${data.windSpeed} m/s', data),
                    Transform.rotate(
                      angle: data.windDeg.toDouble(),
                      child: Icon(
                        Icons.arrow_back,
                        size: 12,
                      ),
                    ),
                  ],
                ),
                _addInfo('Humidity: ', '${data.humidity}%', data),
                _addInfo('Pressure: ', '${data.pressure} hPa', data),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _addInfo('Visibility: ', '${data.visibility} m', data),
                _addInfo('Cloudiness: ', '${data.cloudiness}%', data),
              ],
            )
          ],
        ));
  }

  Widget _addInfo(String descr, String info, data) {
    return Row(
      children: [
        Text(descr,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            )),
        Text(
          info,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}
