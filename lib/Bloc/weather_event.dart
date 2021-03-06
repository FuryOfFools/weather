import 'package:equatable/equatable.dart';
import 'package:weather/Bloc/Classes/classes.dart';

class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/// Инициализация данных
class DataLoadingEvent extends WeatherEvent {
  DataLoadingEvent();
  @override
  List<Object> get props => [];
}

/// Событие запроса погоды
class WeatherRequestEvent extends WeatherEvent {
  final Location location;
  WeatherRequestEvent({this.location}) : assert(location != null);
  @override
  List<Object> get props => [location];
}

/// Событие запроса геолокации
class LocationEvent extends WeatherEvent {
  final Location location;
  LocationEvent({this.location});
  @override
  List<Object> get props => [location];
}

/// Пользователь открыл погоду на конкретный день
class OpenTimeWeatherEvent extends WeatherEvent {
  final WeatherData data;
  final WeatherList list;
  OpenTimeWeatherEvent({this.list, this.data})
      : assert(list != null && data != null);
  @override
  List<Object> get props => [list, data];
}

/// Пользователь открыл поиск города
class SearchEvent extends WeatherEvent {
  final data;
  SearchEvent({this.data});
  @override
  List<Object> get props => [data];
}

/// Переотрисовочка
class DisplayEvent extends WeatherEvent {
  final WeatherData data;
  DisplayEvent({this.data}) : assert(data != null);
  @override
  List<Object> get props => [data];
}
