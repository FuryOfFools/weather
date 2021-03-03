import 'package:flutter/material.dart';
import 'package:weather/Classes/album.dart';

// album.wind,
// album.main.humidity,
// album.main.pressure,
// album.visibility,
// album.clouds,
// album.sys.sunrise,
// album.sys.sunset
class AdditionalInfo extends StatelessWidget {
  final Wind wind;
  final num humidity;
  final num pressure;
  final num visibility;
  final Clouds clouds;

  const AdditionalInfo({
    Key key,
    this.wind,
    this.humidity,
    this.pressure,
    this.visibility,
    this.clouds,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                      'Wind: ${wind.speed}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[800],
                      ),
                    ),
                    Transform.rotate(
                      angle: wind.deg.toDouble(),
                      child: Icon(
                        Icons.arrow_back,
                        size: 12,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Humidity: $humidity%',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  'Pressure: ${pressure}hPa',
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
                  'Visibility: ${visibility}m',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  'Cloudiness: ${clouds.all}%',
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
