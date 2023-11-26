import 'package:flutter/material.dart';

import '../../utils/component_type.dart';

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

  static Color themeColor({
    required int selectedTab,
    required ComponentType componentType,
  }) {
    Color color = const Color.fromARGB(255, 13, 71, 161);
    double opacity = componentType == ComponentType.background
        ? 0.1
        : componentType == ComponentType.bar
            ? 0.88
            : componentType == ComponentType.button
                ? 1.0
                : 0;
    switch (selectedTab) {
      case 0:
        color = const Color.fromARGB(255, 13, 71, 161);
        break;
      case 1:
        color = const Color.fromARGB(255, 25, 88, 29);
        break;
      case 2:
        color = const Color.fromARGB(255, 183, 28, 28);
        break;
    }
    if (componentType == ComponentType.button) {
      color = HSLColor.fromColor(color).withLightness(0.6).toColor();
    }
    return color.withOpacity(opacity);
  }

  static const double appBarHeight = 50.0;

  static const double appBarWidth = 50.0;

  static const double bottomNavigationViewHeight = 80.0;

  static const double bottomNavigationViewWidth = 350.0;

  static const Duration animationDuration = Duration(milliseconds: 600);

  static const double appBarMargin = 30.0;

  static const double appRadius = 15.0;
}
