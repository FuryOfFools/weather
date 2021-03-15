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
                    Text('Wind: ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      '${data.windSpeed} m/s',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[800],
                      ),
                    ),
                    Transform.rotate(
                      angle: data.windDeg.toDouble(),
                      child: Icon(
                        Icons.arrow_back,
                        size: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Humidity: ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${data.humidity}%',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Pressure: ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${data.pressure} hPa',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      'Visibility: ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${data.visibility} m',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Cloudiness: ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${data.cloudiness}%',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
                // Text(
                //   'Sunset: WIP',
                //   style: TextStyle(
                //     fontSize: 12,
                //     color: Colors.grey[800],
                //   ),
                // ),
                // Text(
                //   'Sunrise: WIP',
                //   style: TextStyle(
                //     fontSize: 12,
                //     color: Colors.grey[800],
                //   ),
                // ),
              ],
            )
          ],
        ));
  }
}
