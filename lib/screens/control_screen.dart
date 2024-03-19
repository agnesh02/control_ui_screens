import 'package:flutter/material.dart';
import 'package:ui_screens/widgets/control_screen/bottom_section.dart';
import 'package:ui_screens/widgets/control_screen/fan_section.dart';
import 'package:ui_screens/widgets/control_screen/hvac_section.dart';
import 'package:ui_screens/widgets/control_screen/temperature_humidity_card.dart';
import 'package:ui_screens/widgets/control_screen/vertical_temperature_slider.dart';

class ControlScreen extends StatelessWidget {
  const ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 233, 252),
      appBar: AppBar(
        title: const Text(
          "Two Stage Thermostat",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: _controlsSection(),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 212, 205, 201)),
              child: const BottomSection(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _controlsSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TemperatureHumidityCard(),
            const SizedBox(height: 20),
            _hvacSection(),
            const SizedBox(height: 20),
            _fanSection()
          ],
        ),
        const SizedBox(
          height: 500,
          child: VerticalTemperatureSlider(),
        )
      ],
    );
  }

  Widget _hvacSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "HVAC",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        HvacSection(),
      ],
    );
  }

  Widget _fanSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "FAN",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        FanSection(),
      ],
    );
  }
}
