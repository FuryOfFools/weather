import 'package:equatable/equatable.dart';
import 'package:weather/Bloc/Classes/classes.dart';

class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

/// Начальное состояние
class WeatherInitState extends WeatherState {
  WeatherInitState();
}

/// Ожидание локации
class WeatherLocationUpdatingState extends WeatherState {}

/// Ожидание получения погоды
class WeatherUpdatingState extends WeatherState {
  final Location location;
  WeatherUpdatingState(this.location) : assert(location != null);

  @override
  List<Object> get props => [location];
}

/// Отображение погоды
class WeatherDisplayState extends WeatherState {
  final WeatherData data;
  WeatherDisplayState(this.data) : assert(data != null);

  @override
  List<Object> get props => [data];
}
