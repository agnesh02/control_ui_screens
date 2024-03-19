import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:ui_screens/utils/temp_colour.dart';

class CustomRadialGauge extends StatelessWidget {
  const CustomRadialGauge({
    super.key,
    required this.value,
    required this.shouldBeSmall,
  });

  final double value;
  final bool shouldBeSmall;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(shouldBeSmall ? 5.0 : 0),
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            interval: 10,
            startAngle: 270,
            endAngle: 270,
            showTicks: false,
            showLabels: false,
            axisLineStyle: AxisLineStyle(thickness: shouldBeSmall ? 5 : 10),
            pointers: <GaugePointer>[
              getRangePointer(value),
            ],
            annotations: <GaugeAnnotation>[
              shouldBeSmall ? getSmallAnnotation(value) : getAnnotation(value),
            ],
          )
        ],
      ),
    );
  }

  RangePointer getRangePointer(double value) {
    return RangePointer(
      value: value,
      width: shouldBeSmall ? 5 : 10,
      color: getTempColour(value.toInt()),
      enableAnimation: true,
      cornerStyle: CornerStyle.bothCurve,
    );
  }

  GaugeAnnotation getAnnotation(double value) {
    return GaugeAnnotation(
      widget: CircleAvatar(
        maxRadius: shouldBeSmall ? 32 : 52,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!shouldBeSmall)
                const Text(
                  'Target Temp',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              if (!shouldBeSmall)
                Text(
                  '${value.toInt()}F',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              if (shouldBeSmall)
                Text(
                  '${value.toInt()}%',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
      ),
      angle: 270,
      positionFactor: 0.1,
    );
  }

  GaugeAnnotation getSmallAnnotation(double value) {
    return GaugeAnnotation(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${value.toInt()}F',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
      angle: 270,
      positionFactor: 0.1,
    );
  }
}
