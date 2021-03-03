import 'package:flutter/material.dart';
import 'package:weather/Classes/album.dart';
import 'package:weather/Classes/fetch_album.dart';
import 'package:weather/Classes/selected_location.dart';
import 'package:weather/WeatherPage/weather_page.dart';

class LoadingPage extends StatefulWidget {
  final api = '98a3681fb714bcff7aa402873d3642d6';
  final SelectedLocation location;
  const LoadingPage({Key key, this.location}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  SelectedLocation loc;
  Album album;

  @override
  Widget build(BuildContext context) {
    if (widget.location != null)
      loc = widget.location;
    else
      loc = SelectedLocation();
    return Scaffold(
      body: FutureBuilder(
          future: _getData(widget.api, loc),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              album = snapshot.data;
              loc.city = album.name;
              return WeatherPage(
                location: loc,
                album: album,
              );
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Future<Album> _getData(String api, SelectedLocation location) {
    if (location.lat == null && location.lon == null)
      return fetchAlbumWithCity(api, location.city);
    else
      return fetchAlbumWithCoords(api, location.lat, location.lon);
  }
}