import 'package:flutter/material.dart';

class JsonData extends StatefulWidget {
  final String text;
  JsonData({this.text, Key key}) : super(key: key);

  @override
  JsonDataState createState() => JsonDataState();
}

class JsonDataState extends State<JsonData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.text),
    );
  }
}
