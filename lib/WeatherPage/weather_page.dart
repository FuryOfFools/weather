// Dart & Flutter
import 'package:flutter/material.dart';
// Classes
import 'package:weather/Classes/album.dart';
import 'package:weather/Classes/fetch_album.dart';
import 'package:weather/Classes/selected_location.dart';
// Widgets
import 'package:weather/WeatherPage/weather_data.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  var api = '98a3681fb714bcff7aa402873d3642d6';
  var location = SelectedLocation();
  Album album;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.city),
        leading: IconButton(
          icon: Icon(Icons.room),
          onPressed: _getLocation,
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white70,
          child: FutureBuilder(
              //TODO: для получения погоды на следующие 5 дней сделать колонку
              future: _getData(api, location),
              builder: (content, snapshot) {
                if (snapshot.hasData) {
                  album = snapshot.data;
                  location.city = album.name;
                  return WeatherData(album: album);
                } else
                  return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }

  void _getLocation() async {
    var loc = await location.getLocation();
    setState(() {
      location = loc;
    });
  }

  Future<Album> _getData(String api, SelectedLocation location) {
    if (location.lat == null && location.lon == null)
      return fetchAlbumWithCity(api, location.city);
    else
      return fetchAlbumWithCoords(api, location.lat, location.lon);
  }
}
