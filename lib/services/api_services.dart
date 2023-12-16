import 'dart:convert';

import 'package:g6weatherapp/models/weather_forecast_model.dart';
import 'package:g6weatherapp/models/weather_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  //TRAE INFORMACIÓN DE UN LUGAR, EL LUGAR SE LO PASAMOS POR URL (CUSCO)
  Future<WeatherModel?> getWeatherData() async {
    Uri url = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=70866d7ade244a3c9ca20142230509&q=cusco&aqi=no");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(data);
      return weatherModel;
    }
    return null;
  }

//DEVUELVE INFORMACIÓN DE CIERTO LUGAR A PARTIR DE LAT Y LONG, EN ESTE CASO DEVUELVE UN WEATHERMODEL
  Future<WeatherModel?> getCurrentWeather(
      double latitude, double longitude) async {
    Uri url = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=70866d7ade244a3c9ca20142230509&q=$latitude,$longitude&aqi=no");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(data);
      return weatherModel;
    }
    return null;
  }

//DEVUELVE INFORMACIÓN DE CIERTO LUGAR A PARTIR DE LAT Y LONG, EN ESTE CASO DEVUELVE UN WEATHERFORECASTMODEL
  Future<WeatherForecastModel?> getCurrentForecast(
      double latitude, double longitude) async {
    Uri url = Uri.parse(
        "http://api.weatherapi.com/v1/forecast.json?key=70866d7ade244a3c9ca20142230509&q=$latitude,$longitude&days=1&aqi=no&alerts=no");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      WeatherForecastModel weatherForecastModel =
          WeatherForecastModel.fromJson(data);
      return weatherForecastModel;
    }
    return null;
  }

  //DEVUELVE INFORMACIÓN DE CIERTO LUGAR A PARTIR DEL STRING QUE LE PASEMOS (LUGAR)
  Future<WeatherForecastModel?> getForecastCity(String city) async {
    Uri url = Uri.parse(
        "http://api.weatherapi.com/v1/forecast.json?key=70866d7ade244a3c9ca20142230509&q=$city&days=1&aqi=no&alerts=no");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      WeatherForecastModel weatherForecastModel =
          WeatherForecastModel.fromJson(data);
      return weatherForecastModel;
    }
    return null;
  }
}
