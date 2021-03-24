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
          TileButton(
            icons: Icons.refresh_rounded,
            text: 'Refresh Weather',
            event: WeatherRequestEvent(
                location: Location(city: state.data.cityTitle)),
          ),
          TileButton(
            icons: Icons.search,
            text: 'Search City',
            event: SearchEvent(data: state.data),
          ),
          TileButton(
            icons: Icons.room,
            text: 'Locate City',
            event: LocationEvent(location: null),
          ),
        ],
      ),
    );
  }
}

class TileButton extends StatelessWidget {
  final IconData icons;
  final String text;
  final WeatherEvent event;
  const TileButton({Key key, this.icons, this.text, this.event})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
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
