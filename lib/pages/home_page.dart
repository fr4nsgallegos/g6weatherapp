import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:g6weatherapp/models/weather_forecast_model.dart';
import 'package:g6weatherapp/models/weather_model.dart';
import 'package:g6weatherapp/services/api_services.dart';
import 'package:g6weatherapp/widgets/forecast_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherForecastModel? ciudad;
  // WeatherModel? ciudad;
  bool isLoading = true;
  TextEditingController _cityController = TextEditingController();

  // getDataLocation() async {
  //   ApiServices apiServices = ApiServices();
  //   ciudad = await apiServices.getWeatherData();
  //   if (ciudad != null) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  // Future<void> getCurrentWeather() async {
  //   ApiServices apiServices = ApiServices();
  //   isLoading = true;

  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   print("LATITUD: ${position.latitude}");
  //   print("LONGITUD: ${position.longitude}");

  //   ciudad = await apiServices.getCurrentWeather(
  //       position.latitude, position.longitude);

  //   if (ciudad != null) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  Future<void> getCurrentForecast() async {
    ApiServices apiServices = ApiServices();
    isLoading = true;

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("LATITUD: ${position.latitude}");
    print("LONGITUD: ${position.longitude}");

    ciudad = await apiServices.getCurrentForecast(
        position.latitude, position.longitude);

    print(
      ciudad!.forecast.forecastday[0].hour[0],
    );
    if (ciudad != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getDataLocation();
    // getCurrentWeather();
    getCurrentForecast();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeigth = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff2A2D32),
        appBar: AppBar(
          title: const Text("Weather App"),
          centerTitle: true,
          backgroundColor: const Color(0xff2A2D32),
          elevation: 0,
        ),
        body: isLoading == true && ciudad == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/nube.png",
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ciudad!.current.tempC.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeigth * 0.15,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            " °C",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      )
                    ],
                  ),
                  Text(
                    "${ciudad!.location.name}, ${ciudad!.location.country}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _cityController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Ingrese la ciudad",
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // getPosition();
                      // getWeatherData();
                    },
                    child: Text(
                      "Buscar",
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ciudad!.forecast.forecastday[0].hour.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ForecastWidget(
                          hour: ciudad!.forecast.forecastday[0].hour[index].time
                              .substring(11, 16),
                          temp: ciudad!
                              .forecast.forecastday[0].hour[index].tempC
                              .toString(),
                          isDay:
                              ciudad!.forecast.forecastday[0].hour[index].isDay,
                        );
                      },
                    ),
                  ),
                  // SizedBox(
                  //   height: 200,
                  //   child: SingleChildScrollView(
                  //     scrollDirection: Axis.horizontal,
                  //     child: Row(
                  //       children: [
                  //         ForecastWidget(hour: "10", temp: "15"),
                  //         ForecastWidget(hour: "10", temp: "15"),
                  //         ForecastWidget(hour: "10", temp: "15"),
                  //         ForecastWidget(hour: "10", temp: "15"),
                  //         ForecastWidget(hour: "10", temp: "15"),
                  //         ForecastWidget(hour: "10", temp: "15"),
                  //         ForecastWidget(hour: "10", temp: "15"),
                  //         ForecastWidget(hour: "10", temp: "15"),
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
      ),
    );
  }
}
