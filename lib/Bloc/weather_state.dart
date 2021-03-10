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
class WeatherLocationUpdatingState extends WeatherState {
  final String display = 'Получение геолокации...';
}

/// Ожидание получения погоды
class WeatherUpdatingState extends WeatherState {
  final String display = 'Получение данных с API...';
  final Location location;
  WeatherUpdatingState(this.location) : assert(location != null);

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
