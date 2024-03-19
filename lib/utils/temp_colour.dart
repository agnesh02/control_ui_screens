import 'package:flutter/material.dart';

Color? getTempColour(int value) {
  if (value <= 50) {
    return Colors.blue[800];
  } else if (value <= 80) {
    return Colors.teal;
  } else {
    return Colors.red;
  }
}
