import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';

class AdditionalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<WeatherBloc>(context).state.data;
    return Container(
        width: double.infinity,
        color: Colors.grey[300],
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      'Wind: ${data.windSpeed} m/s',
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
                Text(
                  'Humidity: ${data.humidity}%',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  'Pressure: ${data.pressure} hPa',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Visibility: ${data.visibility} m',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  'Cloudiness: ${data.cloudiness}%',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
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
