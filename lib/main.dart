import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/Bloc/blocs.dart';
import 'Widgets/Pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(),
        child: WeatherBlocBuilder(),
      ),
    );
  }
}
