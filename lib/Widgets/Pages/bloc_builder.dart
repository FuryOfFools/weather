import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';
import 'package:weather/Widgets/pages.dart';

class WeatherBlocBuilder extends StatefulWidget {
  @override
  _WeatherBlocBuilderState createState() => _WeatherBlocBuilderState();
}

class _WeatherBlocBuilderState extends State<WeatherBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        {
          if (state is WeatherInitState) {
            BlocProvider.of<WeatherBloc>(context)
                .add(WeatherLocationEvent(null));
            return LoadingPage(display: 'Загрузка приложения...');
          }
          if (state is WeatherLocationUpdatingState)
            return LoadingPage(display: 'Получение геолокации...');
          if (state is WeatherUpdatingState) {
            BlocProvider.of<WeatherBloc>(context)
                .add(WeatherRequestEvent(state.location));
            return LoadingPage(display: 'Получение данных с API...');
          }
          if (state is WeatherDisplayState) {
            return DisplayPage(data: state.data);
          } else
            return Text('Ошибка'); // TODO: экран обработки ошибок
        }
      },
    );
  }
}
