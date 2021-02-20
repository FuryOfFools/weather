import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  final String location;
  Location({this.location, Key key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.search),
          Text(widget.location),
          Icon(
            Icons.room,
          )
        ],
      ),
    );
  }
}
