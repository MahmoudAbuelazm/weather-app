import '../../models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {
}

class LoadedWeatherState extends WeatherState {
  final WeatherModel weatherModel;
  LoadedWeatherState(this.weatherModel);
}

class FailureWeatherState extends WeatherState {
  final String error;

  FailureWeatherState(this.error);
}
