import 'package:equatable/equatable.dart';
import 'package:weather/Bloc/Classes/classes.dart';

class WeatherState extends Equatable {
  final String display = '';
  final data = null;
  @override
  List<Object> get props => [];
}

/// Начальное состояние
class WeatherInitState extends WeatherState {
  final String display = 'Загрузка приложения...';
  WeatherInitState();
}

/// Ожидание локации
class LocationUpdatingState extends WeatherState {
  final String display = 'Получение геолокации...';
}

class WeatherUpdatinState extends WeatherState {
  final String display = 'Получение данных с API...';
}

/// Ожидание получения погоды
class WeatherRequestingState extends WeatherState {
  final String display = 'Получение данных с API...';
  final Location location;
  WeatherRequestingState(this.location) : assert(location != null);

  @override
  List<Object> get props => [location];
}

/// Отображение погоды
class WeatherDisplayState extends WeatherState {
  final String display = 'Данные получены';
  final WeatherData data;
  WeatherDisplayState(this.data) : assert(data != null);

  @override
  List<Object> get props => [data];
}

/// Отображаем экран с текущей погодой
class OpenTimeWeatherState extends WeatherState {
  final String display = 'Открыт экран с погодой на конкретное время';
  final WeatherList data;
  OpenTimeWeatherState(this.data) : assert(data != null);
  @override
  List<Object> get props => [data];
}
