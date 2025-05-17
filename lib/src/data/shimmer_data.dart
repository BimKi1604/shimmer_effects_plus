import 'package:flutter/material.dart';

/// Direction of shimmer movement
enum ShimmerDirection { ltr, rtl, ttb, btt }

/// Default values of shimmer
class ShimmerData {
  static const Color baseColor = Color(0xFFEDF1F4);
  static const Color highlightColor = Color(0xFFC3CBDC);
  static const Duration defaultPeriod = Duration(milliseconds: 1000);
}