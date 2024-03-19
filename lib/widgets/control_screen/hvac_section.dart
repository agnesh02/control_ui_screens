import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_screens/widgets/control_screen/rounded_control.dart';

class HvacSection extends StatelessWidget {
  const HvacSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _acRow(),
        const SizedBox(height: 10),
        _heaterRow(),
      ],
    );
  }

  Widget _acRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RoundedControl(
          iconData: Icons.ac_unit,
          title: "AC-1",
        ),
        RoundedControl(
          iconData: Icons.ac_unit,
          title: "AC-2",
        ),
      ],
    );
  }

  Widget _heaterRow() {
    return const Row(
      children: [
        RoundedControl(
          iconData: FontAwesomeIcons.fire,
          title: "Heater-1",
        ),
        RoundedControl(
          iconData: FontAwesomeIcons.fire,
          title: "Heater-2",
        ),
        RoundedControl(
          iconData: FontAwesomeIcons.fire,
          title: "Heater-3",
        ),
      ],
    );
  }
}
