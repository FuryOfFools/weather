// Dart & Flutter
import 'package:flutter/material.dart';
// Classes
import 'package:weather/Classes/albums.dart';
import 'package:weather/Classes/selected_location.dart';
import 'package:weather/LoadingPage/loading_page.dart';
// Widgets
import 'package:weather/WeatherPage/weather_data.dart';

class WeatherPage extends StatefulWidget {
  final SelectedLocation location;
  final Albums albums;
  const WeatherPage({Key key, this.location, this.albums}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  var pressed = false;
  var loc;
  @override
  Widget build(BuildContext context) {
    if (pressed)
      return LoadingPage(location: loc);
    else {
      loc = widget.location;
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.location.city),
          leading: IconButton(
            icon: Icon(Icons.room),
            onPressed: () async {
              loc = await loc.getLocation();
              setState(() {
                pressed = true;
              });
            },
          ),
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white38,
            child: WeatherData(albums: widget.albums),
          ),
        ),
      );
    }
  }
}
