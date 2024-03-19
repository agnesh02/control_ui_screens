import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

class HorizontalTemperatureSlider extends StatelessWidget {
  const HorizontalTemperatureSlider({super.key, required this.onValueChanged});

  static final WeightSliderController _controller =
      WeightSliderController(initialWeight: 40, minWeight: 0, interval: 1);

  final void Function(double value) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: VerticalWeightSlider(
        isVertical: false,
        controller: _controller,
        decoration: const PointerDecoration(
          width: 130.0,
          height: 3.0,
          largeColor: Color(0xFF898989),
          mediumColor: Color(0xFFC5C5C5),
          smallColor: Color(0xFFF0F0F0),
          gap: 30.0,
        ),
        onChanged: (double value) {
          onValueChanged(value);
        },
        indicator: Container(
          height: 3.0,
          width: 200.0,
          alignment: Alignment.centerLeft,
          color: Colors.red[300],
        ),
      ),
    );
  }
}
