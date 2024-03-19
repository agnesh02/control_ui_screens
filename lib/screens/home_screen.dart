import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_screens/widgets/home_screen/date_weather_info.dart';
import 'package:ui_screens/widgets/home_screen/monitoring_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 233, 252),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                FloatingActionButton.small(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Color.fromARGB(255, 23, 94, 247),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            height: 130,
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset('assets/images/van.jpg', fit: BoxFit.cover),
          ),
          const DateWeatherInfo(),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6,
                children: const [
                  MonitoringCard(
                    title: "Single Zone Thermostat",
                    tempValue: 74,
                    indicatorValue: 1,
                    iconData: Icons.ac_unit,
                  ),
                  MonitoringCard(
                    title: "Two Stage Thermostat",
                    tempValue: 70,
                    indicatorValue: 12,
                    iconData: Icons.ac_unit,
                  ),
                  MonitoringCard(
                    title: "Single Zone Thermostat",
                    tempValue: 89,
                    indicatorValue: 123,
                    iconData: FontAwesomeIcons.fire,
                  ),
                  MonitoringCard(
                    title: "Single Zone Thermostat",
                    tempValue: 79,
                    indicatorValue: 123,
                    iconData: Icons.ac_unit,
                    isMultiMonitor: true,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
