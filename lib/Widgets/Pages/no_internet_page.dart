import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';

class NoInternetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<WeatherBloc>(context).state;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.display),
              TextButton(
                onPressed: () {
                  BlocProvider.of<WeatherBloc>(context)
                      .add(WeatherRequestEvent(location: state.data));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.orange[50],
                  child: Text('Try again'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
