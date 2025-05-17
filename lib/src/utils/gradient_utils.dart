import 'package:flutter/material.dart';
import 'package:shimmer_effect/src/data/shimmer_data.dart';

/// GradientTransform to shift the shader on bounds
typedef ShaderMover = GradientTransform;

class SlideGradient implements ShaderMover {
  final double progress;
  final ShimmerDirection direction;
  const SlideGradient(this.progress, this.direction);

  @override
  Matrix4? transform(Rect bounds, { TextDirection? textDirection }) {
    final width = bounds.width;
    final height = bounds.height;
    double x = 0, y = 0;

    switch (direction) {
      case ShimmerDirection.ltr:
        x = (width * 2) * progress - width;
        break;
      case ShimmerDirection.rtl:
        x = -((width * 2) * progress - width);
        break;
      case ShimmerDirection.ttb:
        y = (height * 2) * progress - height;
        break;
      case ShimmerDirection.btt:
        y = -((height * 2) * progress - height);
        break;
    }

    return Matrix4.identity()..translate(x, y);
  }
}