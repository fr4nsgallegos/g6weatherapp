import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  getWeatherData() async {
    Uri url = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=70866d7ade244a3c9ca20142230509&q=lima&aqi=no");
    http.Response response = await http.get(url);
    print(response.statusCode);

    print(jsonDecode(response.body)["location"]["name"]);
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
        body: Column(
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
                  "27",
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
              "LONGON, UK",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  getWeatherData();
                },
                child: Text("DEBUG"))
          ],
        ),
      ),
    );
  }
}
