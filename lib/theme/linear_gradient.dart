import 'package:flutter/material.dart';

class LinearGradientBackground {
  static LinearGradient getBlueGrey() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.blueGrey,
        Colors.blueGrey.withOpacity(0.7),
      ],
    );
  }
}
