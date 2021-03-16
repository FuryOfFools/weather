import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/Classes/classes.dart';
import 'package:weather/Bloc/blocs.dart';

class DrawerWidget extends StatelessWidget {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final WeatherState state = BlocProvider.of<WeatherBloc>(context).state;
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _locateCity(
            context,
            Icons.refresh_rounded,
            'Refresh Weather',
            WeatherRequestEvent(location: Location(city: state.data.cityTitle)),
          ),
          _locateCity(
            context,
            Icons.search,
            'Search City',
            SearchEvent(data: state.data),
          ),
          _locateCity(
            context,
            Icons.room,
            'Locate City',
            LocationEvent(location: null),
          ),
        ],
      ),
    );
  }

  Widget _locateCity(context, IconData icons, String text, WeatherEvent event) {
    return ListTile(
      title: Row(
        children: [
          Icon(
            icons,
            size: 20,
            color: Color(0xffec6e4c),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      onTap: () {
        BlocProvider.of<WeatherBloc>(context).add(event);
      },
    );
  }
}
