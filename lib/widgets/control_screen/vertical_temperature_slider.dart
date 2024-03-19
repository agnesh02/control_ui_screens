import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:ui_screens/providers/vertical_temp_provider.dart';
import 'package:ui_screens/widgets/common/custom_radial_gauge.dart';

// ignore: must_be_immutable
class VerticalTemperatureSlider extends ConsumerStatefulWidget {
  const VerticalTemperatureSlider({super.key});

  static double _value = 10.0;

  @override
  ConsumerState<VerticalTemperatureSlider> createState() =>
      _VerticalTemperatureSliderState();
}

class _VerticalTemperatureSliderState
    extends ConsumerState<VerticalTemperatureSlider> {
  @override
  Widget build(BuildContext context) {
    return SfSliderTheme(
      data: _sliderThemeData(),
      child: SfSlider.vertical(
        isInversed: true,
        min: 0,
        max: 100,
        interval: 5,
        minorTicksPerInterval: 1,
        activeColor: const Color.fromARGB(255, 225, 233, 252),
        inactiveColor: const Color.fromARGB(255, 225, 233, 252),
        showTicks: true,
        showLabels: false,
        enableTooltip: false,
        thumbIcon: CustomRadialGauge(
          value: VerticalTemperatureSlider._value,
          shouldBeSmall: false,
        ),
        value: VerticalTemperatureSlider._value,
        onChanged: (dynamic newValue) {
          ref.read(verticalTempProvider.notifier).state =
              double.parse(newValue.toString()).toInt();
          setState(() {
            VerticalTemperatureSlider._value = newValue;
          });
        },
      ),
    );
  }

  SfSliderThemeData _sliderThemeData() {
    return SfSliderThemeData(
      thumbColor: Colors.white,
      thumbRadius: 60,
      thumbStrokeWidth: 2,
      activeTickColor: Colors.blue,
      inactiveTickColor: Colors.red,
      tickOffset: const Offset(-12.0, 0.0),
      tickSize: const Size(25.0, 1.0),
      minorTickSize: const Size(15.0, 1.0),
    );
  }
}
