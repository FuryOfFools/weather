import 'package:bloc/bloc.dart';
import 'package:weather/Bloc/Classes/classes.dart';
import 'package:weather/Bloc/weather_event.dart';
import 'package:weather/Bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitState());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is LocationEvent) {
      yield* _mapLocationEventToState(event);
    }
    if (event is WeatherRequestEvent) {
      yield* _mapWeatherEventToState(event);
    }
    if (event is DisplayEvent) yield WeatherDisplayState(data: event.data);
    if (event is OpenTimeWeatherEvent) {
      yield OpenTimeWeatherState(data: event.data, additionalData: event.list);
    }
    if (event is SearchEvent) {
      yield SearchState(data: event.data);
    }
  }
}

Stream<WeatherState> _mapLocationEventToState(LocationEvent event) async* {
  if (event.location != null)
    yield WeatherRequestingState(data: event.location);
  else {
    yield LocationUpdatingState();
    Location location = Location();
    await location.getLocation();
    yield WeatherRequestingState(data: location);
  }
}

Stream<WeatherState> _mapWeatherEventToState(WeatherRequestEvent event) async* {
  try {
    yield WeatherUpdatinState();
    Albums albums = Albums();
    await albums.getData(Resources.apiKey, event.location);
    Location location = Location(
        city: albums.album.name,
        lat: event.location.lat,
        lon: event.location.lon);
    var data = WeatherData(
      album: albums.album,
      album5days: albums.album5days,
      location: location,
    );
    yield WeatherDisplayState(data: data);
  } on LoadAlbumException catch (e) {
    yield ErrorState(e.cause);
  } on NoInternetExeption catch (e) {
    yield NoInternetState(
        display: e.cause,
        data: Location(lat: event.location.lat, lon: event.location.lon));
  }
}
