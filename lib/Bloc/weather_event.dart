import 'package:equatable/equatable.dart';
import 'package:weather/Bloc/Classes/classes.dart';

class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/// Событие запроса погоды
class WeatherRequestEvent extends WeatherEvent {
  final Location location;
  WeatherRequestEvent(this.location) : assert(location != null);
  @override
  List<Object> get props => [location];
}

/// Событие запроса геолокации
class WeatherLocationEvent extends WeatherEvent {
  final Location location;
  WeatherLocationEvent(this.location);
  @override
  List<Object> get props => [location];
}

/// Пользователь открыл погоду на конкретный день
class OpenTimeWeatherEvent extends WeatherEvent {
  final WeatherList data;
  OpenTimeWeatherEvent(this.data) : assert(data != null);
  @override
  List<Object> get props => [data];
}

class SearchEvent extends WeatherEvent {
  final String cityTitle;
  SearchEvent(this.cityTitle) : assert(cityTitle != null);
  @override
  List<Object> get props => [cityTitle];
}
