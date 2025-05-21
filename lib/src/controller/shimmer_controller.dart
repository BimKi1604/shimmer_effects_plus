import 'dart:async';
import 'package:flutter/material.dart';
import '../data/shimmer_data.dart';

/// Manage AnimationController for shimmer
class ShimmerController {
  final AnimationController controller;
  bool enabled;
  bool isLoadingAutoEffect;
  final Future<void> Function()? task;

  ShimmerController({
    required TickerProvider vsync,
    this.enabled = true,
    this.isLoadingAutoEffect = false,
    this.task,
    Duration? period,
  }) : controller = AnimationController(
          vsync: vsync,
          duration: period ?? ShimmerData.defaultPeriod,
        ) {
    if (enabled) controller.repeat();
    if (task != null) {
      Future.microtask(() async  => await runTask(task!));
    }
  }

  void update({bool? newEnabled, Duration? newPeriod, bool? auto, Future<void> Function()? taskParams }) async {
    if (newEnabled != null) {
      if (newEnabled && !controller.isAnimating) controller.repeat();
      if (!newEnabled && controller.isAnimating) controller.stop();
    }
    if (newPeriod != null && newPeriod != controller.duration) {
      controller
        ..duration = newPeriod
        ..repeat();
    }
    if (auto != null && auto != isLoadingAutoEffect) {
      isLoadingAutoEffect = auto;
    }
    if (taskParams != null) {
      await runTask(taskParams);
    }
  }

  Future<void> runTask(Future<void> Function() taskParams) async {
    isLoadingAutoEffect = false;
    try {
      await taskParams(); /// process function
    } finally {
      isLoadingAutoEffect = true;
    }
  }

  void dispose() => controller.dispose();
}
