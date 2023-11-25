import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';
import '../cubits/get_weather_cubit/get_weather_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is LoadedWeatherState) {
            return WeatherInfoBody(
              weatherModel: state.weatherModel,
            );
          } else if (state is FailureWeatherState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadingState) {
            return const Center(
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text('oops there is an error')),
              ],
            );
          }
        },
      ),
    );
  }
}
