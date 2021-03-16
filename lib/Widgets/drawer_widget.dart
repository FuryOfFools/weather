import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';

class DrawerWidget extends StatelessWidget {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<WeatherBloc>(context).state;
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
                  color: Color(0xffec6e4c),
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
              BlocProvider.of<WeatherBloc>(context)
                  .add(LocationEvent(location: null));
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.search,
                  size: 20,
                  color: Color(0xffec6e4c),
                ),
                Text(
                  'Search City',
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            onTap: () {
              BlocProvider.of<WeatherBloc>(context)
                  .add(SearchEvent(data: state.data));
            },
          ),
        ],
      ),
    );
  }
}
