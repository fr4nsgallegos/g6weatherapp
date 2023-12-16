import 'package:flutter/material.dart';

class ForecastWidget extends StatelessWidget {
  String hour;
  String temp;

  ForecastWidget({
    required this.hour,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 4,
            offset: Offset(4, 8),
          )
        ],
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            "$hour AM",
            style: TextStyle(color: Colors.white60, fontSize: 15),
          ),
          SizedBox(
            height: 8,
          ),
          Icon(
            Icons.cloud_outlined,
            size: 60,
            color: Colors.white,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "$temp °C",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
