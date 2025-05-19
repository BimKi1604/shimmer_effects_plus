import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_effects_plus/src/data/shimmer_data.dart';
import 'package:shimmer_effects_plus/src/widget/component/shimmer_list.dart';
import 'package:shimmer_effects_plus/src/widget/shimmer_effects_plus/shimmer_effect_view.dart';

class ShimmerListPage extends StatefulWidget {
  final int qtyPerLine;
  final ShimmerShapeType shape;
  final int quantity;

  const ShimmerListPage(
      {super.key,
      this.qtyPerLine = 3,
      this.shape = ShimmerShapeType.square,
      this.quantity = 3});

  @override
  State<ShimmerListPage> createState() => _ShimmerListPageState();
}

class _ShimmerListPageState extends State<ShimmerListPage> {
  double getSizeByLine() {
    double heightPerLine = 20;
    double spacing = 3.0;
    return heightPerLine * widget.qtyPerLine +
        (spacing * widget.qtyPerLine - 1);
  }

  Widget getShape() {
    if (widget.shape == ShimmerShapeType.square) {
      return ShimmerEffectWidget.rectangle(
          width: getSizeByLine(), height: getSizeByLine());
    }
    return ShimmerEffectWidget.circle(size: getSizeByLine());
  }

  Widget get listComponent => Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            getShape(),
            const SizedBox(width: 10.0),
            Expanded(
              child: ShimmerList(
                qtyLine: widget.qtyPerLine,
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(widget.quantity, (index) => listComponent));
  }
}
