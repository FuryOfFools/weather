import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather/Temp/temp_data.dart';

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
            return Text(snapshot.data.toString());
          } else if (snapshot.hasError) return Text("${snapshot.error}");
          return CircularProgressIndicator();
        },
      );
    // return FutureBuilder(
    //   future: _getLocation(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       loc = snapshot.data;
    //       return JsonData(
    //           api: widget.api,
    //           lat: loc.latitude.toString(),
    //           lon: loc.longitude.toString());
    //     } else if (snapshot.hasError) return Text("${snapshot.error}");
    //     return CircularProgressIndicator();
    //   },
    // );
    else
      return JsonData(
        api: widget.api,
        location: widget.city,
      );
  }

  Future<LocationData> _getLocation() async {
    var status = false;
    var currentLocation;
    try {
      status = await coords.requestService();
    } catch (e) {
      throw Exception('Не удалось получить разрешение');
    }
    if (status)
      try {
        currentLocation = await coords.getLocation();
      } catch (e) {
        throw Exception('Не удалось определить местоположение');
      }
    else
      throw Exception('Определить местоположение невозможно');
    return currentLocation;
  }
}
