import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather/HomePage/temp_data.dart';

class Locations extends StatefulWidget {
  final String api;
  String city;
  Locations({this.api, this.city, Key key}) : super(key: key);
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  var coords = new Location();
  LocationData loc;

  @override
  Widget build(BuildContext context) {
    if (widget.city == null)
      return FutureBuilder(
        future: _getLocation(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            loc = snapshot.data;
            return JsonData(
                api: widget.api,
                lat: loc.latitude.toString(),
                lon: loc.longitude.toString());
          } else if (snapshot.hasError) return Text("${snapshot.error}");
          return CircularProgressIndicator();
        },
      );
    else
      return JsonData(
        api: widget.api,
        location: widget.city,
      );
  }

  Future<LocationData> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await coords.getLocation(); //getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }
}
