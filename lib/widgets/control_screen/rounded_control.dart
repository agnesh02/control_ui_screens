import 'package:flutter/material.dart';

class RoundedControl extends StatelessWidget {
  const RoundedControl({
    super.key,
    required this.iconData,
    required this.title,
  });

  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Icon(
                iconData,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Text(title)
          ],
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
