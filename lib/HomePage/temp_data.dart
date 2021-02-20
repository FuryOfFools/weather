import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class JsonData extends StatefulWidget {
  final String api;
  String lat;
  String lon;
  String location;
  JsonData({this.api, Key key, this.lat, this.lon, this.location})
      : super(key: key);

  @override
  JsonDataState createState() => JsonDataState();
}

class JsonDataState extends State<JsonData> {
  @override
  Widget build(BuildContext context) {
    if (widget.location == null)
      return Container(
          child: FutureBuilder<String>(
        future: fetchAlbum(widget.api, widget.lat, widget.lon),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return Text(snapshot.data);
          else if (snapshot.hasError) return Text("${snapshot.error}");
          return CircularProgressIndicator();
        },
      ));
    else
      return Container(
          child: FutureBuilder<String>(
        future: fetchAlbum1(widget.api, widget.location),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return Text(snapshot.data);
          else if (snapshot.hasError) return Text("${snapshot.error}");
          return CircularProgressIndicator();
        },
      ));
  }
}

Future<String> fetchAlbum(String api, String lat, String lon) async {
  //final response = await http.get(Uri.https('api.openweathermap.org',
  //    '/data/2.5/weather', {'q': '$location', 'appid': '$api'}));
  final response = await http.get(Uri.https('api.openweathermap.org',
      '/data/2.5/weather', {'lat': lat, 'lon': lon, 'appid': '$api'}));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonEncode(response.body);
    //Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<String> fetchAlbum1(String api, String location) async {
  final response = await http.get(Uri.https('api.openweathermap.org',
      '/data/2.5/weather', {'q': '$location', 'appid': '$api'}));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonEncode(response.body);
    //Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
// class Album {
//   final int id;
//   final String name;

//   Album({this.id, this.name});

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }
