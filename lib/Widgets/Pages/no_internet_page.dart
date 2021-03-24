import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';

class NoInternetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<WeatherBloc>(context).state;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(state.display),
            TextButton(
              onPressed: () {
                BlocProvider.of<WeatherBloc>(context)
                    .add(WeatherRequestEvent(location: state.data));
              },
              child: Text('Try again'),
            )
          ],
        ),
      ),
    );
  }
}
