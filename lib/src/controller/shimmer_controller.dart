import 'package:flutter/material.dart';
import '../data/shimmer_data.dart';

/// Manage AnimationController for shimmer
class ShimmerController {
  final AnimationController controller;
  final bool enabled;

  ShimmerController({
    required TickerProvider vsync,
    this.enabled = true,
    Duration? period,
  }) : controller = AnimationController(
    vsync: vsync,
    duration: period ?? ShimmerData.defaultPeriod,
  ) {
    if (enabled) controller.repeat();
  }

  void update({ bool? newEnabled, Duration? newPeriod }) {
    if (newEnabled != null) {
      if (newEnabled && !controller.isAnimating) controller.repeat();
      if (!newEnabled && controller.isAnimating) controller.stop();
    }
    if (newPeriod != null && newPeriod != controller.duration) {
      controller
        ..duration = newPeriod
        ..repeat();
    }
  }

  void dispose() => controller.dispose();
}