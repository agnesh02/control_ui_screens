import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  double _value = 40.0;
  WeightSliderController _controller = WeightSliderController(
      initialWeight: 40, minWeight: 0, interval: 1);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget._controller = WeightSliderController(
        initialWeight: widget._value, minWeight: 0, interval: 0.1);
  }

  @override
  Widget build(BuildContext context) {
    return SfSliderTheme(
      data: SfSliderThemeData(
        thumbColor: Colors.white,
        thumbRadius: 80,
        thumbStrokeWidth: 2,
        activeTickColor: Colors.red,
        inactiveTickColor: Colors.red,
        tickOffset: const Offset(-12.0, 0.0),
        tickSize: const Size(25.0, 1.0),
        minorTickSize: const Size(15.0, 1.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: SfSlider.vertical(
              min: 0,
              max: 100,
              interval: 5,
              minorTicksPerInterval: 1,
              activeColor: Colors.white,
              inactiveColor: Colors.white,
              showTicks: true,
              showLabels: false,
              enableTooltip: false,
              thumbIcon: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    interval: 10,
                    startAngle: 0,
                    endAngle: 360,
                    showTicks: false,
                    showLabels: false,
                    axisLineStyle: const AxisLineStyle(thickness: 10),
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: widget._value,
                        width: 10,
                        color: const Color(0xFFFFCD60),
                        enableAnimation: true,
                        cornerStyle: CornerStyle.bothCurve,
                      )
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Column(
                          children: <Widget>[
                            Container(
                              width: 50.00,
                              height: 50.00,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage('images/sun.png'),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Target Temp',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${widget._value.toInt()}°F',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        angle: 270,
                        positionFactor: 0.1,
                      )
                    ],
                  )
                ],
              ),
              value: widget._value,
              onChanged: (dynamic newValue) {
                setState(() {
                  widget._value = newValue;
                });
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 100,
            child: VerticalWeightSlider(
              isVertical: false,
              controller: widget._controller,
              decoration: const PointerDecoration(
                width: 130.0,
                height: 3.0,
                largeColor: Color(0xFF898989),
                mediumColor: Color(0xFFC5C5C5),
                smallColor: Color(0xFFF0F0F0),
                gap: 30.0,
              ),
              onChanged: (double value) {
                setState(() {
                  widget._value = value;
                });
              },
              indicator: Container(
                height: 3.0,
                width: 200.0,
                alignment: Alignment.centerLeft,
                color: Colors.red[300],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
