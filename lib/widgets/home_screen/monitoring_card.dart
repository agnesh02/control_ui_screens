import 'package:flutter/material.dart';
import 'package:ui_screens/widgets/common/custom_radial_gauge.dart';

class MonitoringCard extends StatelessWidget {
  const MonitoringCard({
    super.key,
    required this.tempValue,
    required this.indicatorValue,
    this.isMultiMonitor = false,
    required this.title,
    required this.iconData,
  });

  final String title;
  final double tempValue;
  final int indicatorValue;
  final IconData iconData;
  final bool isMultiMonitor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _header(),
          !isMultiMonitor ? _centerWidget() : specialMonitoringCard(),
          _footer(),
        ],
      ),
    );
  }

  Widget _footer() {
    return Column(
      children: [
        const Text("Room"),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 61, 106, 255),
          ),
          onPressed: () {},
          child: const Text(
            "CTRL",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget _centerWidget() {
    return Expanded(
      child: Stack(
        children: [
          CustomRadialGauge(value: tempValue, shouldBeSmall: false),
          _indication(),
        ],
      ),
    );
  }

  Widget _indication() {
    return Positioned(
      left: 78,
      bottom: 15,
      child: Column(
        children: [
          Icon(
            iconData,
            size: 16,
          ),
          Text(
            "$indicatorValue",
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _roundedIcon(iconData: Icons.wifi),
            _roundedIcon(iconData: Icons.signal_cellular_alt),
            _roundedIcon(iconData: Icons.bluetooth),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _roundedIcon({required IconData iconData}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.blue[100],
        child: Icon(
          iconData,
          color: const Color.fromARGB(255, 11, 96, 255),
          size: 17,
        ),
      ),
    );
  }

  Widget specialMonitoringCard() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 0.9,
        children: List.generate(
          4,
          (index) => Stack(
            alignment: Alignment.topCenter,
            children: [
              Text(
                "${index + 1}",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomRadialGauge(value: tempValue, shouldBeSmall: true),
              ),
              Positioned(
                left: 35,
                bottom: 15,
                child: Column(
                  children: [
                    const Icon(
                      Icons.ac_unit,
                      size: 8,
                    ),
                    Text(
                      "$indicatorValue",
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
