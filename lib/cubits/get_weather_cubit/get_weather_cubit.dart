import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';

import '../../models/weather_model.dart';
import '../../service/get_location.dart';
import '../../service/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(
        LoadedWeatherState(
          weatherModel!,
        ),
      );
    } catch (e) {
      emit(FailureWeatherState(e.toString()));
    }
  }

  void getWeatherFromLocation() async {
    emit(WeatherLoadingState());
    try {
      print('success');
      // location =
      // 'Lat: ${position.latitude} , Long: ${position.longitude}';
      List<Placemark> placemark = await GetLocation().getLocation();
      weatherModel = await WeatherService(Dio())
          .getCurrentWeather(cityName: placemark[0].locality!);
      // weatherModel = weather;
      print(placemark[0].locality!);

      emit(LoadedWeatherState(weatherModel!));
    } on Exception catch (e) {
      print('error');
      emit(FailureWeatherState(e.toString()));
    }
  }
}
