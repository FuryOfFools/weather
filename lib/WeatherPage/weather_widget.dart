import 'package:flutter/material.dart';
import 'package:weather/Classes/selected_location.dart';
import 'package:weather/Classes/album.dart';
import 'package:weather/Classes/fetch_album.dart';
import 'package:weather/WeatherPage/weather_data.dart';

class WeatherWidget extends StatefulWidget {
  final String api;
  final SelectedLocation location;
  WeatherWidget({this.api, this.location, Key key}) : super(key: key);

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  Album album;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        //TODO: для получения погоды на следующие 5 дней сделать колонку
        future: _getData(widget.api, widget.location),
        builder: (content, snapshot) {
          if (snapshot.hasData) {
            album = snapshot.data;
            widget.location.city = album.name;
            return WeatherData(album: album);
          } else
            return CircularProgressIndicator();
        });
  }

  Future<Album> _getData(String api, SelectedLocation location) {
    if (location.lat == null && location.lon == null)
      return fetchAlbumWithCity(api, location.city);
    else
      return fetchAlbumWithCoords(api, location.lat, location.lon);
  }
}
