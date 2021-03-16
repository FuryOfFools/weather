import 'package:equatable/equatable.dart';
import 'Classes/classes.dart';

class WeatherState extends Equatable {
  final String display = '';
  final data = null;
  final additionalData = null;
  @override
  List<Object> get props => [];
}

/// Начальное состояние
class WeatherInitState extends WeatherState {
  final String display = 'Application is loading...';
  WeatherInitState();
}

/// Ожидание локации
class LocationUpdatingState extends WeatherState {
  final String display = 'Getting geolocation...';
}

/// Ожидание погоды
class WeatherUpdatinState extends WeatherState {
  final String display = 'Getting data from the API...';
}

/// Ожидание получения погоды
class WeatherRequestingState extends WeatherState {
  final String display = 'Getting data from the API...';
  final Location data;
  WeatherRequestingState({this.data}) : assert(data != null);

  @override
  List<Object> get props => [data];
}

/// Отображение погоды
class WeatherDisplayState extends WeatherState {
  final String display = 'Data received';
  final WeatherData data;
  WeatherDisplayState({this.data}) : assert(data != null);

  @override
  List<Object> get props => [data];
}

/// Отображаем экран с текущей погодой
class OpenTimeWeatherState extends WeatherState {
  final String display =
      'The screen with the weather for a specific time is open';
  final WeatherData data;
  final WeatherList additionalData;
  OpenTimeWeatherState({this.data, this.additionalData})
      : assert(data != null && additionalData != null);
  @override
  List<Object> get props => [data, additionalData];
}

/// Отображаем экран загрузки
class SearchState extends WeatherState {
  final String display = 'The city weather search screen is open';
  final WeatherData data;
  SearchState({this.data}) : assert(data != null);
  @override
  List<Object> get props => [data];
}

class ErrorState extends WeatherState {
  final String display;
  ErrorState(this.display);
  @override
  List<Object> get props => [display];
}
