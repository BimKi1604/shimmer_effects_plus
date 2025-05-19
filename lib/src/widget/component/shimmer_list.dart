import 'package:flutter/material.dart';
import 'package:shimmer_effects_plus/src/data/shimmer_data.dart';
import 'package:shimmer_effects_plus/src/widget/shimmer_effects_plus/shimmer_effect_view.dart';

class ShimmerList extends StatelessWidget {
  final int qtyLine;
  final double height;
  final double verticalSpacing;
  final double radius;
  final Color mainColor;
  final Color subColor;

  const ShimmerList(
      {super.key,
      required this.qtyLine,
      this.height = 20,
      this.radius = 0.0,
      this.verticalSpacing = 4.0,
      this.subColor = ShimmerData.subColor,
      this.mainColor = ShimmerData.mainColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return SizedBox(
        width: size.width,
        child: Column(
          children: List.generate(qtyLine, (index) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: index == qtyLine - 1 ? 0 : verticalSpacing),
              child: ShimmerEffectWidget.rectangle(
                width: double.infinity,
                height: height,
                radius: radius,
                mainColor: mainColor,
                subColor: subColor,
              ),
            );
          }),
        ));
  }
}
