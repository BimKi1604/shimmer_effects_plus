import 'package:shimmer_effects_plus/src/widget/shimmer_effects_plus/shimmer_effect_view.dart';
import '../../controller/shimmer_controller.dart';
import '../../utils/gradient_utils.dart';
import 'package:flutter/material.dart';

/// The state for Shimmer effect view
class ShimmerEffectWidgetState extends State<ShimmerEffectWidget>
    with SingleTickerProviderStateMixin {
  late final ShimmerController shimmerCtrl;

  @override
  void initState() {
    super.initState();
    shimmerCtrl = ShimmerController(
      vsync: this,
      enabled: widget.enabled,
      period: widget.period,
    );
  }

  @override
  void didUpdateWidget(covariant ShimmerEffectWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    shimmerCtrl.update(
      newEnabled: widget.enabled,
      newPeriod: widget.period,
    );
  }

  @override
  void dispose() {
    shimmerCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: shimmerCtrl.controller,
        builder: (context, _) {
          return ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) {
              final gradient = LinearGradient(
                colors: [
                  widget.subColor,
                  widget.subColor,
                  widget.mainColor,
                  widget.subColor,
                  widget.subColor,
                ],
                stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.repeated,
                transform: SlideGradient(
                  shimmerCtrl.controller.value,
                  widget.direction,
                ),
              );
              final inflated = bounds.inflate(bounds.width);
              return gradient.createShader(inflated);
            },
            child: widget.child,
          );
        },
      ),
    );
  }
}
