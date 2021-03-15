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
    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) {
        {
          if (state is OpenTimeWeatherState) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TimeWeatherPage()));
            //return TimeWeatherPage();
          }
          if (state is SearchState) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SearchPage()));
            //return SearchPage();
          }
        }
      },
      builder: (context, state) {
        if (state is WeatherInitState) {
          BlocProvider.of<WeatherBloc>(context).add(WeatherLocationEvent(null));
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
        return Text('ошибка');
      },
    );
  }
}
