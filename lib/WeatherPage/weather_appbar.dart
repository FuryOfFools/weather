import 'package:flutter/material.dart';
import 'package:weather/Classes/selected_location.dart';

// ignore: must_be_immutable
class WeatherAppBar extends StatefulWidget implements PreferredSizeWidget {
  ValueNotifier<SelectedLocation> location;
  WeatherAppBar({this.location, Key key}) : super(key: key);

  @override
  _WeatherAppBarState createState() => _WeatherAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _WeatherAppBarState extends State<WeatherAppBar> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.location,
      builder: (context, SelectedLocation value, child) {
        return AppBar(
          title: Text(value.city),
          leading: IconButton(
            icon: Icon(Icons.room),
            onPressed: _getLocation,
          ),
        );
      },
    );
  }

  void _getLocation() async {
    var loc = await widget.location.value.getLocation();
    var l = ValueNotifier<SelectedLocation>(
        SelectedLocation(city: loc.city, lat: loc.lat, lon: loc.lon));
    setState(() {
      widget.location = l;
    });
  }
}
