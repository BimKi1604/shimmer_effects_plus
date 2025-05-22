import 'dart:math';

import 'package:flutter/material.dart';

/// class help for shape
class ShapeUtil {
  static TriangleClipper get triangleClipper => TriangleClipper();
}

/// Clip rect to triangle
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

/// Clip rect to star
class StarClipper extends CustomClipper<Path> {
  final int numberOfPoints;

  StarClipper({this.numberOfPoints = 5});

  @override
  Path getClip(Size size) {
    final double w = size.width;
    final double h = size.height;
    final double radius = min(w, h) / 2;

    final Path path = Path();
    final double angle = pi / numberOfPoints;

    for (int i = 0; i < numberOfPoints * 2; i++) {
      double r = (i % 2 == 0) ? radius : radius / 2.5;
      double x = w / 2 + r * cos(i * angle - pi / 2);
      double y = h / 2 + r * sin(i * angle - pi / 2);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
