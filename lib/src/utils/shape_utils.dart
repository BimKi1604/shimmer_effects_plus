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
