import 'package:flutter/material.dart';

class DateWeatherInfo extends StatelessWidget {
  const DateWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 193, 218, 255),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _renderLeftRow(),
          const Text("71.65F"),
        ],
      ),
    );
  }

  Widget _renderLeftRow() {
    return Row(
      children: [
        const Icon(Icons.wb_sunny_outlined),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today June 19, 2023",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Sunny",
              style: TextStyle(
                color: Colors.blueAccent[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
