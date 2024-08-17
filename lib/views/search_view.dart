import 'package:animated_flutter_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 10,
            ),
            ShakeAnimation(
              child: Image.asset(
                'images/search.png',
                height: height / 4,
                width: width * 0.8,
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (value) async {
                      var getWeatherCubit =
                          BlocProvider.of<GetWeatherCubit>(context);
                      getWeatherCubit.getWeather(
                        cityName: value,
                      );
                      Navigator.pop(context);
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Enter City Name",
                      labelText: "Search",
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: .5,
                    ),
                  ),
                  child: IconButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          const CircleBorder(
                            side: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        var getWeatherCubit =
                            BlocProvider.of<GetWeatherCubit>(context);
                        getWeatherCubit.getWeatherFromLocation(
                         
                        );
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.location_on_outlined)),
                )
              ],
            ),
            SizedBox(
              height: height / 20,
            ),
          ],
        ),
      ),
    );
  }
}
