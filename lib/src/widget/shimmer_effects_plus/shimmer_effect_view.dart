import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer_effects_plus/src/utils/shape_utils.dart';
import 'package:shimmer_effects_plus/src/widget/shimmer_effects_plus/shimmer_effect_state.dart';
import '../../data/shimmer_data.dart';

/// The main class for shimmer effect
class ShimmerEffectWidget extends StatefulWidget {
  final Widget child;
  /// sub color in gradients
  final Color subColor;

  /// main color in gradients
  final Color mainColor;

  /// time animation shimmer
  final Duration period;

  /// direction of shimmer
  final ShimmerDirection direction;

  /// turn off/on shimmer effect
  final bool enabled;

  /// turn off/on auto loading shimmer
  final bool autoShimmer;

  /// The shimmer effect will be hidden after the function ends
  final Future<void> Function()? funcShimmer;

  const ShimmerEffectWidget._({
    super.key,
    required this.child,
    this.subColor = ShimmerData.subColor,
    this.mainColor = ShimmerData.mainColor,
    this.period = ShimmerData.defaultPeriod,
    this.direction = ShimmerDirection.ltr,
    this.enabled = true,
    this.funcShimmer,
    this.autoShimmer = false,
  });

  factory ShimmerEffectWidget.cover({
    Key? key,
    required Widget child,
    subColor = ShimmerData.subColor,
    mainColor = ShimmerData.mainColor,
    period = ShimmerData.defaultPeriod,
    direction = ShimmerDirection.ltr,
    enabled = true,
  }) {
    return ShimmerEffectWidget._(
      key: key,
      direction: direction,
      enabled: enabled,
      mainColor: mainColor,
      period: period,
      subColor: subColor,
      child: child,
    );
  }

  factory ShimmerEffectWidget.auto({
    Key? key,
    required Widget child,
    required Future<void> Function() funcShimmer,
    subColor = ShimmerData.subColor,
    mainColor = ShimmerData.mainColor,
    period = ShimmerData.defaultPeriod,
    direction = ShimmerDirection.ltr,
    enabled = true,
  }) {
    return ShimmerEffectWidget._(
      key: key,
      autoShimmer: true,
      direction: direction,
      enabled: enabled,
      mainColor: mainColor,
      period: period,
      subColor: subColor,
      funcShimmer: funcShimmer,
      child: child,
    );
  }

  factory ShimmerEffectWidget.circle({
    Key? key,
    required double size,
    Color subColor = ShimmerData.subColor,
    Color mainColor = ShimmerData.mainColor,
    Duration period = ShimmerData.defaultPeriod,
    ShimmerDirection direction = ShimmerDirection.ltr,
    bool enabled = true,
  }) {
    return ShimmerEffectWidget.cover(
      key: key,
      subColor: subColor,
      mainColor: mainColor,
      period: period,
      direction: direction,
      enabled: enabled,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: subColor,
        ),
      ),
    );
  }

  factory ShimmerEffectWidget.rectangle({
    Key? key,
    required double width,
    required double height,
    Color subColor = ShimmerData.subColor,
    Color mainColor = ShimmerData.mainColor,
    Duration period = ShimmerData.defaultPeriod,
    ShimmerDirection direction = ShimmerDirection.ltr,
    double radius = 0.0,
    bool enabled = true,
  }) {
    return ShimmerEffectWidget.cover(
      key: key,
      subColor: subColor,
      mainColor: mainColor,
      period: period,
      direction: direction,
      enabled: enabled,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          shape: BoxShape.rectangle,
          color: subColor,
        ),
      ),
    );
  }

  factory ShimmerEffectWidget.triangle({
    Key? key,
    required double size,
    Color subColor = ShimmerData.subColor,
    Color mainColor = ShimmerData.mainColor,
    Duration period = ShimmerData.defaultPeriod,
    ShimmerDirection direction = ShimmerDirection.ltr,
    bool enabled = true,
  }) {
    return ShimmerEffectWidget.cover(
      key: key,
      subColor: subColor,
      mainColor: mainColor,
      period: period,
      direction: direction,
      enabled: enabled,
      child: ClipPath(
        clipper: ShapeUtil.triangleClipper,
        child: Container(
          width: size,
          height: size,
          color: subColor,
        ),
      ),
    );
  }

  @override
  State<ShimmerEffectWidget> createState() => ShimmerEffectWidgetState();
}
