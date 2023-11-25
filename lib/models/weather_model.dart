class WeatherModel {
  final String cityName;
  final double temp;
  final DateTime date;

  final String? image;
  final double maxtemp;
  final double mintemp;
  final String weathercondition;

  WeatherModel(
      {required this.cityName,
      required this.temp,
      required this.date,
      this.image,
      required this.maxtemp,
      required this.mintemp,
      required this.weathercondition});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      cityName: json["location"]["name"],
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      date: DateTime.parse(json["current"]["last_updated"]),
      maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      mintemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weathercondition: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
    );
  }
}
