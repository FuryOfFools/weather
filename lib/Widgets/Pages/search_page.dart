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
  // ValueNotifier<String> _text;

  // @override
  // void initState() {
  //   _text = ValueNotifier<String>('');
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _text.dispose();
  //   super.dispose();
  // }

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<WeatherBloc>(context).state;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search weather in...'),
          leading: IconButton(
            onPressed: () {
              BlocProvider.of<WeatherBloc>(context)
                  .add(DisplayEvent(data: state.data));
            },
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            TextField(
              controller: controller,
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
                    if (controller.text != null) {
                      BlocProvider.of<WeatherBloc>(context).add(LocationEvent(
                          location: Location(city: controller.text)));
                    }
                  },
                ),
                labelText: 'Enter the name of the city',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
