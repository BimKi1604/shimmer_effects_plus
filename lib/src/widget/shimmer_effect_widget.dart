import 'package:flutter/material.dart';
import '../controller/shimmer_controller.dart';
import '../data/shimmer_data.dart';
import '../utils/gradient_transform.dart';

/// The main class for shimmer loading
class ShimmerEffectWidget extends StatefulWidget {
  final Widget child;
  final Color baseColor;
  final Color highlightColor;
  final Duration period;
  final ShimmerDirection direction;
  final bool enabled;

  const ShimmerEffectWidget({
    super.key,
    required this.child,
    this.baseColor = ShimmerData.baseColor,
    this.highlightColor = ShimmerData.highlightColor,
    this.period = ShimmerData.defaultPeriod,
    this.direction = ShimmerDirection.ltr,
    this.enabled = true,
  });

  @override
  State<ShimmerEffectWidget> createState() => _ShimmerEffectWidgetState();
}

class _ShimmerEffectWidgetState extends State<ShimmerEffectWidget>
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
                  widget.baseColor,
                  widget.highlightColor,
                  widget.baseColor,
                ],
                stops: const [0.25, 0.5, 0.75],
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