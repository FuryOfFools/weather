// Dart & Flutter
import 'package:flutter/material.dart';
import 'package:weather/Classes/fetch_album.dart';
// Classes
import 'package:weather/Classes/selected_location.dart';
import 'package:weather/Classes/album.dart';
// Widgets
import 'package:weather/HomePage/weather_data.dart';

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
              //TODO: передалать через ValueListenableBuilder
              future: _getData(api, location),
              builder: (content, snapshot) {
                if (snapshot.hasData) {
                  album = snapshot.data;
                  location.city = album.name;
                  return WeatherData(
                    curWeather: album.weather[0].main,
                    descWeather: album.weather[0].description,
                    icon: album.weather[0].icon,
                    temp: album.main.temp,
                    feelTemp: album.main.feelsLike,
                  );
                } else
                  return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }

  void _getLocation() {
    setState(() async {
      location = await location.getLocation();
      album = await _getData(api, location);
    });
  }

  Future<Album> _getData(String api, SelectedLocation location) {
    if (location.lat == null && location.lon == null)
      return fetchAlbumWithCity(api, location.city);
    else
      return fetchAlbumWithCoords(api, location.lat, location.lon);
  }
}
