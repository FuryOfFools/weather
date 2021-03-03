import 'package:flutter/material.dart';
import 'package:weather/Classes/albums.dart';
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
  Albums albums;

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
              albums = snapshot.data;
              loc.city = albums.album.name;
              return WeatherPage(
                location: loc,
                albums: albums,
              );
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Future<Albums> _getData(String api, SelectedLocation location) async {
    var albums = Albums();
    if (location.lat == null && location.lon == null) {
      albums.album = await fetchAlbumWithCity(api, location.city);
      albums.album5days = await fetchAlbum5WithCity(api, location.city);
      return albums;
    } else {
      albums.album =
          await fetchAlbumWithCoords(api, location.lat, location.lon);
      albums.album5days =
          await fetchAlbum5WithCoords(api, location.lat, location.lon);
      return albums;
    }
  }
}
