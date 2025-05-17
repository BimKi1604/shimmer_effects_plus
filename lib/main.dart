import 'package:flutter/material.dart';
import 'package:shimmer_effect/src/data/shimmer_data.dart';
import 'package:shimmer_effect/src/widget/shimmer_effect/shimmer_effect_view.dart';

void main() {
  runApp(const Example());
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shimmer Tile Example',
      home: ShimmerPage(),
    );
  }
}

class ShimmerPage extends StatefulWidget {
  const ShimmerPage({super.key});

  @override
  State<ShimmerPage> createState() => _ShimmerPageState();
}

class _ShimmerPageState extends State<ShimmerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo Shimmer Effect")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerEffectWidget.cover(
                subColor: Colors.grey[300]!,
                mainColor: Colors.grey[100]!,
                period: const Duration(milliseconds: 1200),
                direction: ShimmerDirection.ttb,
                child: Container(width: 100, height: 100, color: Colors.white),
              ),
              const SizedBox(height: 20.0),
              ShimmerEffectWidget.cover(
                subColor: Colors.grey[800]!,
                mainColor: Colors.grey[400]!,
                period: const Duration(milliseconds: 1500),
                direction: ShimmerDirection.ttb,
                child: const Text("> Slide to Unlock loading text", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
              ),
              ShimmerEffectWidget.cover(
                subColor: Colors.grey[800]!,
                mainColor: Colors.grey[400]!,
                period: const Duration(milliseconds: 1500),
                direction: ShimmerDirection.ttb,
                child: Column(
                  children: [
                    Row(
                      children: [
                        ShimmerEffectWidget.circle(size: 60),
                        const SizedBox(width: 20,),
                        ShimmerEffectWidget.rectangle(width: 60, height: 15,),
                        const SizedBox(width: 20,),
                        ShimmerEffectWidget.triangle(size: 60)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
