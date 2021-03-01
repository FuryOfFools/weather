import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather/Classes/album.dart';

Future<Album> fetchAlbumWithCoords(String api, String lat, String lon) async {
  //final response = await http.get(Uri.https('api.openweathermap.org',
  //    '/data/2.5/weather', {'q': '$location', 'appid': '$api'}));
  //TODO: сделать империческую (фаренгейт)
  final response = await http.get(Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {'lat': lat, 'lon': lon, 'appid': '$api', 'units': 'metric'}));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Album> fetchAlbumWithCity(String api, String location) async {
  final response = await http.get(Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {'q': '$location', 'appid': '$api', 'units': 'metric'}));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
