// Dart & Flutter
import 'package:flutter/material.dart';
// Classes
import 'package:weather/Classes/album.dart';
import 'package:weather/Classes/selected_location.dart';
import 'package:weather/LoadingPage/loading_page.dart';
// Widgets
import 'package:weather/WeatherPage/weather_data.dart';

class WeatherPage extends StatefulWidget {
  final SelectedLocation location;
  final Album album;

  const WeatherPage({Key key, this.location, this.album}) : super(key: key);

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
              loc = await widget.location.getLocation();
              setState(() {
                pressed = true;
              });
            },
          ),
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white70,
            child: WeatherData(album: widget.album),
          ),
        ),
      );
    }
  }
}

// class WeatherPage extends StatefulWidget {
//   @override
//   _WeatherPageState createState() => _WeatherPageState();
// }

// class _WeatherPageState extends State<WeatherPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(location.city),
//         leading: IconButton(
//           icon: Icon(Icons.room),
//           onPressed: null, //TODO: loading page _getLocation,
//         ),
//       ),
//       body: SafeArea(
//         child: Container(
//           color: Colors.white70,
//           child: FutureBuilder(
//               //TODO: для получения погоды на следующие 5 дней сделать колонку
//               future: _getData(api, location),
//               builder: (content, snapshot) {
//                 if (snapshot.hasData) {
//                   album = snapshot.data;
//                   location.city = album.name;
//                   return WeatherData(album: album);
//                 } else
//                   return CircularProgressIndicator();
//               }),
//         ),
//       ),
//     );
//   }

// Future<Album> _getData(String api, SelectedLocation location) {
//   if (location.lat == null && location.lon == null)
//     return fetchAlbumWithCity(api, location.city);
//   else
//     return fetchAlbumWithCoords(api, location.lat, location.lon);
// }
// }
