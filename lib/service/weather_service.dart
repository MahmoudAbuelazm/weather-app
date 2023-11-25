import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

const String apiKey = "cfc392a5522e4d0c9aa115928230811";

class WeatherService {
  final Dio dio;

  final String baseurl = 'https://api.weatherapi.com/v1';

  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseurl/forecast.json?key=$apiKey&q=$cityName&days=1");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there is an error, please try again later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there is an error, please try again later');
    }
  }
}
