import 'package:flutter/material.dart';
import 'package:ui_screens/widgets/control_screen/card_bottom_section.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GridView.count(
        childAspectRatio: (3 / 1.7),
        crossAxisSpacing: 5,
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        children: const [
          CardBottomSection(
            iconData: Icons.calendar_month,
            title: "SCHEDULING",
            subTitle: "Tap to customize",
          ),
          CardBottomSection(
            iconData: Icons.alarm,
            title: "PET MONITORING",
            subTitle: "Tap to see more details",
          ),
          CardBottomSection(
            iconData: Icons.attach_money_rounded,
            title: "HVAC COST TRACKER",
            subTitle: "Tap to customize",
          ),
          CardBottomSection(
            iconData: Icons.pin_drop,
            title: "GPS COORDINATES",
            subTitle: "Tap to customize",
          ),
        ],
      ),
    );
  }
}
