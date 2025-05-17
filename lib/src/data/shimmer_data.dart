import 'package:flutter/material.dart';

/// Direction of shimmer movement
enum ShimmerDirection {
  /// left to right
  ltr,
  /// right to left
  rtl,
  /// top to bottom
  ttb,
  /// bottom to top
  btt
}

/// Type of shape shimmer
enum ShimmerShapeType {
  circle, square
}

/// Default values of shimmer
class ShimmerData {
  static const Color subColor = Color(0xFFEDF1F4);
  static const Color mainColor = Color(0xFFC3CBDC);
  static const Duration defaultPeriod = Duration(milliseconds: 1200);
}