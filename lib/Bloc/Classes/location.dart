import 'package:location/location.dart' as Loc;

class Location {
  String city;
  String lat;
  String lon;

  Location({this.city = 'London', this.lat, this.lon});

  Future getLocation() async {
    //var location = Location();
    var status = false;
    Loc.LocationData locData;
    var loc = Loc.Location();
    try {
      status = await loc.requestService();
      if (status) {
        locData = await loc.getLocation();
        this.lat = locData.latitude.toString();
        this.lon = locData.longitude.toString();
      }
    } catch (e) {
      throw Exception('Ошибка получения местоположения');
    }
  }
}
