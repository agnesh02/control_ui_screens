import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_screens/widgets/control_screen/rounded_control.dart';

class FanSection extends StatelessWidget {
  const FanSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        RoundedControl(
          iconData: FontAwesomeIcons.a,
          title: "Auto",
        ),
        RoundedControl(
          iconData: FontAwesomeIcons.fan,
          title: "Low Fan",
        ),
        RoundedControl(
          iconData: FontAwesomeIcons.fan,
          title: "High Fan",
        ),
      ],
    );
  }
}
