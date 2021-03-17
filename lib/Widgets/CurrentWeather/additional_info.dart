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
        decoration: _decoration(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    AddInfo(
                      description: 'Wind: ',
                      info: '${data.windSpeed} m/s ${data.windDirection}',
                    ),
                    Transform.rotate(
                      angle: data.windDegrees.toDouble(),
                      child: Icon(
                        Icons.arrow_back,
                        size: 12,
                      ),
                    ),
                  ],
                ),
                AddInfo(
                  description: 'Humidity: ',
                  info: '${data.humidity}%',
                ),
                AddInfo(
                  description: 'Pressure: ',
                  info: '${data.pressure} hPa',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AddInfo(
                  description: 'Visibility: ',
                  info: '${data.visibility} m',
                ),
                AddInfo(
                  description: 'Cloudiness: ',
                  info: '${data.cloudiness}%',
                ),
              ],
            )
          ],
        ));
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.amber[50],
      boxShadow: [
        BoxShadow(
          color: Colors.grey[200],
          spreadRadius: 1,
          blurRadius: 2,
        ),
      ],
    );
  }
}

class AddInfo extends StatelessWidget {
  final String description, info;
  const AddInfo({this.description, this.info, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(description,
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
