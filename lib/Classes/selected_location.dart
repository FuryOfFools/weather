import 'package:location/location.dart';

class SelectedLocation {
  String city;
  String lat;
  String lon;

  SelectedLocation({this.city = 'London', this.lat, this.lon});

  Future<SelectedLocation> getLocation() async {
    var location = SelectedLocation();
    var status = false;
    LocationData locData;
    var loc = Location();
    try {
      status = await loc.requestService();
      if (status) {
        locData = await loc.getLocation();
        location.lat = locData.latitude.toString();
        location.lon = locData.longitude.toString();
      }
    } catch (e) {
      throw Exception('Ошибка получения местоположения');
    }
    return location;
  }
}
