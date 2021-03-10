import 'package:bloc/bloc.dart';
import 'package:weather/Bloc/Classes/classes.dart';
import 'package:weather/Bloc/weather_event.dart';
import 'package:weather/Bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitState());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherLocationEvent) {
      yield* _mapLocationEventToState(event);
    }
    if (event is WeatherRequestEvent) {
      yield* mapWeatherEventToState(event);
    }
  }
}

Stream<WeatherState> _mapLocationEventToState(
    WeatherLocationEvent event) async* {
  if (event.location != null)
    yield WeatherUpdatingState(event.location);
  else {
    yield WeatherLocationUpdatingState();
    Location location = Location();
    await location.getLocation();
    yield WeatherUpdatingState(location);
  }
}

Stream<WeatherState> mapWeatherEventToState(WeatherRequestEvent event) async* {
  Albums albums = Albums();
  String api =
      '98a3681fb714bcff7aa402873d3642d6'; //TODO: переместить куда-нибудь
  await albums.getData(api, event.location);
  Location location = Location(
      city: albums.album.name,
      lat: event.location.lat,
      lon: event.location.lon);
  var data = WeatherData(
      album: albums.album, album5days: albums.album5days, location: location);
  yield WeatherDisplayState(data);
}
