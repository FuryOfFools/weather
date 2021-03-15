import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child:
                    Text(BlocProvider.of<WeatherBloc>(context).state.display),
                margin: EdgeInsets.all(10),
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
