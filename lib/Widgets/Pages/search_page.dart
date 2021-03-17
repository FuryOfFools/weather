import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/Classes/classes.dart';
import 'package:weather/Bloc/blocs.dart';
import 'package:weather/Bloc/weather_bloc.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<WeatherBloc>(context).state;
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(state.data),
        body: Column(
          children: [
            TextBox(controller: _controller),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(data) {
    return AppBar(
      title: Text('Search weather in...'),
      leading: IconButton(
        onPressed: () {
          BlocProvider.of<WeatherBloc>(context).add(DisplayEvent(data: data));
        },
        icon: Icon(
          Icons.arrow_back,
          size: 25,
          color: Colors.black,
        ),
      ),
    );
  }
}

class TextBox extends StatefulWidget {
  final TextEditingController controller;
  const TextBox({Key key, this.controller}) : super(key: key);

  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onSubmitted: (value) {
        if (value != null) {
          BlocProvider.of<WeatherBloc>(context)
              .add(LocationEvent(location: Location(city: value)));
        }
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            if (widget.controller.text != null) {
              BlocProvider.of<WeatherBloc>(context).add(LocationEvent(
                  location: Location(city: widget.controller.text)));
            }
          },
        ),
        labelText: 'Enter the name of the city',
      ),
    );
  }
}
