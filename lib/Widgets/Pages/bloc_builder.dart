import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';
import 'package:weather/Widgets/Pages/pages.dart';

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
            BlocProvider.of<WeatherBloc>(context).add(LocationEvent(null));
            return LoadingPage();
          }
          if (state is LocationUpdatingState) return LoadingPage();
          if (state is WeatherUpdatinState) return LoadingPage();
          if (state is WeatherRequestingState) {
            BlocProvider.of<WeatherBloc>(context)
                .add(WeatherRequestEvent(state.data));
            return LoadingPage();
          }
          if (state is WeatherDisplayState) {
            return DisplayPage();
          }
          if (state is OpenTimeWeatherState) {
            return TimeWeatherPage();
          }
          if (state is SearchState) {
            return SearchPage();
          } else
            return Text('Ошибка'); // TODO: экран обработки ошибок
        }
      },
    );
  }
}
