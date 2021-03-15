import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<WeatherBloc>(context).state.data;
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.room,
                  size: 20,
                  color: Colors.deepOrange[700],
                ),
                Text(
                  'Locate Current City',
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            onTap: () {
              BlocProvider.of<WeatherBloc>(context).add(LocationEvent(null));
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.deepOrange[700],
                ),
                Text(
                  'Locate Current City',
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            onTap: () {
              BlocProvider.of<WeatherBloc>(context).add(SearchEvent(data));
            },
          ),
        ],
      ),
    );
  }
}
