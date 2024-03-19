import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_screens/providers/vertical_temp_provider.dart';
import 'package:ui_screens/utils/temp_colour.dart';
import 'package:ui_screens/widgets/common/custom_radial_gauge.dart';

class TemperatureHumidityCard extends ConsumerWidget {
  const TemperatureHumidityCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(verticalTempProvider);

    return Container(
      padding: const EdgeInsets.all(10),
      width: 250,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              width: 100,
              child: Text(
                "${value}F",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: getTempColour(value),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              children: [
                Expanded(
                  child: CustomRadialGauge(
                    value: 60,
                    shouldBeSmall: true,
                  ),
                ),
                Text("Room Hum"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
