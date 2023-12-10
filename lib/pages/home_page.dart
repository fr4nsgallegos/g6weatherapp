import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
          ],
        ),
      ),
    );
  }
}
