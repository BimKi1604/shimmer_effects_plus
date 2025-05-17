import 'package:flutter/material.dart';
import 'package:shimmer_effect/src/utils/shape_utils.dart';
import 'package:shimmer_effect/src/widget/shimmer_effect/shimmer_effect_state.dart';
import '../../data/shimmer_data.dart';

/// The main class for shimmer effect
class ShimmerEffectWidget extends StatefulWidget {
  final Widget child;
  final Color subColor; /// sub color in gradients
  final Color mainColor; /// main color in gradients
  final Duration period; /// time animation shimmer
  final ShimmerDirection direction; /// direction of shimmer
  final bool enabled;

  const ShimmerEffectWidget._({
    super.key,
    required this.child,
    this.subColor = ShimmerData.subColor,
    this.mainColor = ShimmerData.mainColor,
    this.period = ShimmerData.defaultPeriod,
    this.direction = ShimmerDirection.ltr,
    this.enabled = true,
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