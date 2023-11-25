import 'package:animated_flutter_widgets/animated_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weatherModel;

  WeatherInfoBody({Key? key, required this.weatherModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            getThemeColor(weatherModel.weathercondition),
            getThemeColor(weatherModel.weathercondition)[300]!,
            getThemeColor(weatherModel.weathercondition)[200]!
          ])),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 4,
            ),
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: height / 100,
            ),
            Text(
              "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShakeAnimation(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: getThemeColor(
                            BlocProvider.of<GetWeatherCubit>(context)
                                .weatherModel
                                ?.weathercondition,
                          ).withOpacity(.2),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: CachedNetworkImage(
                      imageUrl: "https:${weatherModel.image}",
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Text(
                  weatherModel.temp.round().toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Min temp ${weatherModel.mintemp.round()}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: height / 100,
                    ),
                    Text(
                      "Max temp ${weatherModel.maxtemp.round()}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height / 20,
            ),
            Text(
              weatherModel.weathercondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
