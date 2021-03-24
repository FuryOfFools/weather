import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather/Bloc/Classes/classes.dart';
import 'package:weather/Bloc/Classes/Albums/album.dart';
import 'package:weather/Bloc/Classes/Albums/album5days.dart';

class LoadAlbumException implements Exception {
  String cause;
  LoadAlbumException(this.cause);
}

class Albums {
  Album album;
  Album5Days album5days;

  Albums({this.album, this.album5days});

  Future<void> getData(String api, Location location) async {
    //var albums = Albums();
    if (location.lat == null && location.lon == null) {
      this.album = await fetchAlbumWithCity(api, location.city);
      this.album5days = await fetchAlbum5WithCity(api, location.city);
    } else {
      this.album = await fetchAlbumWithCoords(api, location.lat, location.lon);
      this.album5days =
          await fetchAlbum5WithCoords(api, location.lat, location.lon);
    }
  }
}

Future<Album> fetchAlbumWithCoords(String api, String lat, String lon) async {
  //TODO: сделать империческую (фаренгейт)
  final response = await http.get(Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {'lat': lat, 'lon': lon, 'appid': '$api', 'units': 'metric'}));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw LoadAlbumException('Failed to load album');
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
    throw LoadAlbumException('Failed to load album');
  }
}

Future<Album5Days> fetchAlbum5WithCoords(
    String api, String lat, String lon) async {
  final response = await http.get(Uri.https(
      'api.openweathermap.org',
      '/data/2.5/forecast',
      {'lat': lat, 'lon': lon, 'appid': '$api', 'units': 'metric'}));

  if (response.statusCode == 200) {
    return Album5Days.fromJson(jsonDecode(response.body));
  } else {
    throw LoadAlbumException('Failed to load album');
  }
}

Future<Album5Days> fetchAlbum5WithCity(String api, String location) async {
  final response = await http.get(Uri.https(
      'api.openweathermap.org',
      '/data/2.5/forecast',
      {'q': '$location', 'appid': '$api', 'units': 'metric'}));

  if (response.statusCode == 200) {
    return Album5Days.fromJson(jsonDecode(response.body));
  } else {
    throw LoadAlbumException('Failed to load album');
  }
}
