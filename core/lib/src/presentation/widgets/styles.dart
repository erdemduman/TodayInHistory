import 'package:flutter/material.dart';

class Styles {
  static final LinearGradient shimmerGradient = LinearGradient(
    colors: [
      Colors.grey[300]!,
      Colors.grey[400]!,
      Colors.grey[300]!, // Light gray
    ],
    stops: const [
      0.1,
      0.3,
      0.4,
    ],
    begin: const Alignment(-1.0, -0.3),
    end: const Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
}
